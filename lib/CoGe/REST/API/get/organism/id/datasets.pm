package CoGe::REST::API::get::organism::id::datasets;

use warnings;
use strict;

use CoGe::Format::Dataset;
use CoGe::REST::AbstractObjectListGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectListGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::Dataset->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_objects {
        my ( $self, $id ) = @_;

        # Fetch the organism.
        my $coge     = CoGeX->dbconnect();
        my $organism = $coge->resultset('Organism')->find($id);
        return if !defined $organism;

        # Return the list of genomes.
        return [ $organism->datasets() ];
    }
}

1;
