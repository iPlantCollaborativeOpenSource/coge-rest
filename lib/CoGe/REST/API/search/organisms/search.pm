package CoGe::REST::API::search::organisms::search;

use warnings;
use strict;

use Apache2::URI;
use Class::Std::Utils;
use CoGe::REST::Handler;
use CoGeX;
use CoGeX::ResultSet::Organism;

use base 'CoGe::REST::Handler';
{
    my %parent_of;
    my %search_string_of;

    sub new {
        my ( $class, $parent, $search_string ) = @_;

        # Create the new class instance.
        my $self = $class->SUPER::new();

        # Set the attributes.
        $parent_of{ ident $self}        = $parent;
        $search_string_of{ ident $self} = $search_string;

        return $self;
    }

    sub DESTROY {
        my ($self) = @_;

        # Delete the attributes for the object being destroyed.
        delete $parent_of{ ident $self};
        delete $search_string_of{ ident $self};
    }

    sub GET {
        my ( $self, $request, $response ) = @_;
        $self->SUPER::GET( $request, $response );

        # Fetch the search string.
        my $search_string = $search_string_of{ ident $self };

        # Find matching organisms.
        my $coge      = CoGeX->dbconnect();
        my @organisms = $coge->resultset('Organism')->resolve($search_string);

        # Format the result.
        my @organism_hashes
            = map { format_organism_hash( $request, $_ ) } @organisms;
        $response->data()->{'item'} = \@organism_hashes;

        return Apache2::Const::HTTP_OK;
    }

    sub format_organism_hash {
        my ( $request, $organism_ref ) = @_;

        # Build the initial hash.
        my %hash = $organism_ref->get_columns();

        # Add the URL used to access the organism.
        my $organism_id  = $organism_ref->id();
        my $organism_url = $request->construct_url("/coge/get/$organism_id");
        $hash{'organism_url'} = $organism_url;

        # Add the URL used to access the organism's genomes.
        my $genomes_url = "$organism_url/genomes";
        $hash{'genomes_url'} = $genomes_url;

        return \%hash;
    }

    sub isAuth {
        my ( $self, $method, $request ) = @_;
        return $method eq 'GET' ? 1 : 0;
    }
}

1;
