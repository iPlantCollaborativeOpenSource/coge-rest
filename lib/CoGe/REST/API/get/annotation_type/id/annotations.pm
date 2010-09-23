package CoGe::REST::API::get::annotation_type::id::annotations;

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

        # Fetch the annotation type.
        my $coge     = CoGeX->dbconnect();
        my $annotation_type = $coge->resultset('AnnotationType')->find($id);
        return if !defined $annotation_type;

        # Return the list of annotations.
        return [ $annotation_type->annotations() ];
    }
}

1;
