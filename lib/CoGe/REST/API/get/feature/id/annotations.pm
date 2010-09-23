package CoGe::REST::API::get::feature::id::annotations;

use warnings;
use strict;

use CoGe::Format::Annotation;
use CoGe::REST::AbstractObjectListGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectListGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::Annotation->new();
        
        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_objects {
        my ( $self, $id ) = @_;

        # Fetch the feature.
        my $coge   = CoGeX->dbconnect();
        my $feature = $coge->resultset('Feature')->find($id);
        return if !defined $feature;

        # Return the list of annotations.
        return [ $feature->annotations() ];
    }
}

1;
