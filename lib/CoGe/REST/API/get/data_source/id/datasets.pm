package CoGe::REST::API::get::data_source::id::datasets;

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

        # Fetch the data_source.
        my $coge        = CoGeX->dbconnect();
        my $data_source = $coge->resultset('DataSource')->find($id);
        return if !defined $data_source;

        # Return the list of datasets.
        return [ $data_source->datasets() ];
    }
}

1;
