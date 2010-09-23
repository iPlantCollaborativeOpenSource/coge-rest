package CoGe::REST::API::get::annotation::id::feature_name;

use warnings;
use strict;

use CoGe::Format::FeatureName;
use CoGe::REST::AbstractObjectGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::FeatureName->new();
        
        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Fetch the annotation.
        my $coge       = CoGeX->dbconnect();
        my $annotation = $coge->resultset('Annotation')->find($id);
        return if !defined $annotation;

        # Return the feature name.
        return $annotation->feature_name();
    }
}

1;
