package CoGe::Format::Organism;

use warnings;
use strict;

use Apache2::URI;
use Apache2::REST::Handler;
use Class::Std::Utils;

use interface 'CoGe::Format';
use base 'Apache2::REST::Handler';
{
    sub new {
        my ($class) = @_;

        # Create the new object instance.
        my $self = bless anon_scalar(), $class;

        return $self;
    }
    
    sub build_hash {
        my ( $self, $request, $organism_ref ) = @_;

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
}

1;
