package CoGe::REST::API::get::feature_name::id;

use warnings;
use strict;

use CoGe::Format::FeatureName;
use CoGe::REST::AbstractObjectGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter for objects that we fetch.
        my $formatter = CoGe::Format::FeatureName->new();

        # Create the class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($data_source) = $coge->resultset('FeatureName')->find($id);

        return $data_source;
    }
}

1;
