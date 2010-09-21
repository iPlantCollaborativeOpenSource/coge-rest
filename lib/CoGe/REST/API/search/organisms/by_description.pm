package CoGe::REST::API::search::organisms::by_description;

use warnings;
use strict;

use Apache2::URI;
use Class::Std::Utils;
use CoGe::Format::Organism;
use CoGe::REST::Handler;
use CoGeX;
use CoGeX::ResultSet::Organism;

use base 'CoGe::REST::Handler';
{
    my %search_string_of;

    sub new {
        my ( $class, $parent, $search_string ) = @_;

        # Create the new class instance.
        my $self = $class->SUPER::new();

        # Set the attributes.
        $search_string_of{ ident $self} = $search_string;

        return $self;
    }

    sub DESTROY {
        my ($self) = @_;

        # Delete the attributes for the object being destroyed.
        delete $search_string_of{ ident $self};
    }

    sub GET {
        my ( $self, $request, $response ) = @_;
        $self->SUPER::GET( $request, $response );

        # Fetch the search string.
        my $search_string = $search_string_of{ ident $self };
        return Apache2::Const::HTTP_BAD_REQUEST if !defined $search_string;

        # Find matching organisms.
        my $coge = CoGeX->dbconnect();
        my @organisms
            = $coge->resultset('Organism')
            ->search(
            { 'description' => { '-like' => '%' . $search_string . '%' } },
            {} );

        # Format the result.
        my $format = CoGe::Format::Organism->new();
        my @organism_hashes
            = map { $format->build_hash( $request, $_ ) } @organisms;
        $response->data()->{'item'} = \@organism_hashes;

        return Apache2::Const::HTTP_OK;
    }

    sub buildNext {
        my ( $self, $frag, $req ) = @_;
        return __PACKAGE__->new( $self, $frag );
    }
}

1;

