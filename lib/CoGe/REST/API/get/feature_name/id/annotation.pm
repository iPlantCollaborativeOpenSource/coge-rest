package CoGe::REST::API::get::feature_name::id::annotation;

use warnings;
use strict;

use CoGe::Format::Annotation;
use CoGe::REST::AbstractObjectGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::Annotation->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Fetch the feature name.
        my $coge         = CoGeX->dbconnect();
        my $feature_name = $coge->resultset('FeatureName')->find($id);
        return if !defined $feature_name;

        # Return the feature name.
        return $feature_name->annotation();
    }
}

1;
