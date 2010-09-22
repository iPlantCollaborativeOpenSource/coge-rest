package CoGe::REST::API::get::dataset::id::features;

use warnings;
use strict;

use CoGe::Format::Feature;
use CoGe::REST::AbstractObjectListGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectListGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::Feature->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_objects {
        my ( $self, $id ) = @_;

        # Fetch the dataset.
        my $coge   = CoGeX->dbconnect();
        my $genome = $coge->resultset('Dataset')->find($id);
        return if !defined $genome;

        # Return the list of features.
        return [ $genome->features() ];
    }
}

1;
