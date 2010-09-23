package CoGe::REST::API::get::annotation_type_group::id::annotation_types;

use warnings;
use strict;

use CoGe::Format::AnnotationType;
use CoGe::REST::AbstractObjectListGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectListGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::AnnotationType->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_objects {
        my ( $self, $id ) = @_;

        # Fetch the annotation type group.
        my $coge  = CoGeX->dbconnect();
        my $group = $coge->resultset('AnnotationTypeGroup')->find($id);
        return if !defined $group;

        # Return the list of annotation types.
        return [ $group->annotation_types() ];
    }
}

1;
