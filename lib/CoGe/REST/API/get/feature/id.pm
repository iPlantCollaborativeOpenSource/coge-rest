package CoGe::REST::API::get::feature::id;

use warnings;
use strict;

use CoGe::Format::Feature;
use CoGe::REST::AbstractObjectGetter;
use CoGe::REST::API::get::feature::id::annotations;
use CoGe::REST::API::get::feature::id::feature_names;
use CoGe::REST::API::get::feature::id::locations;
use CoGe::REST::API::get::feature::id::sequences;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter for objects that we fetch.
        my $formatter = CoGe::Format::Feature->new();

        # Create the class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($data_source) = $coge->resultset('Feature')->find($id);

        return $data_source;
    }
}

1;
