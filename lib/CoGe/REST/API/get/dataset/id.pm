package CoGe::REST::API::get::dataset::id;

use warnings;
use strict;

use CoGe::Format::Dataset;
use CoGe::REST::AbstractObjectGetter;
use CoGe::REST::API::get::dataset::id::features;
use CoGe::REST::API::get::dataset::id::feature_summary;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter for objects that we fetch.
        my $formatter = CoGe::Format::Dataset->new();

        # Create the class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($dataset) = $coge->resultset('Dataset')->find($id);

        return $dataset;
    }
}

1;
