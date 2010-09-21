package CoGe::REST::API::get::organism::id;

use warnings;
use strict;

use CoGe::Format::Organism;
use CoGe::REST::AbstractObjectGetter;
use CoGe::REST::API::get::organism::id::current_genome;
use CoGe::REST::API::get::organism::id::genomes;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $parent, $id ) = @_;

        # Create the formatter for objects that we fetch.
        my $formatter = CoGe::Format::Organism->new();

        # Create the class instance.
        my $self = $class->SUPER::new( $parent, $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($organism) = $coge->resultset('Organism')->find($id);

        return $organism;
    }

    sub buildNext {
        my ( $self, $frag, $req ) = @_;

        # Determine the package of the next handler in the chain.
        my $current_package = ref $self;
        my $package = "${current_package}::$frag";
        
        return $package->new( $self, $self->get_id() );
    }
}

1;
