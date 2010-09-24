package CoGe::REST::API::get::feature_type::id::features;

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

        # Fetch the feature type.
        my $coge         = CoGeX->dbconnect();
        my $feature_type = $coge->resultset('FeatureType')->find($id);
        return if !defined $feature_type;

        # Return the list of features.
        return [ $feature_type->features() ];
    }
}

1;
