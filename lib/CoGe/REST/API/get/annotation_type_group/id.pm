package CoGe::REST::API::get::annotation_type_group::id;

use warnings;
use strict;

use CoGe::Format::AnnotationTypeGroup;
use CoGe::REST::AbstractObjectGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter for objects that we fetch.
        my $formatter = CoGe::Format::AnnotationTypeGroup->new();

        # Create the class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($group) = $coge->resultset('AnnotationTypeGroup')->find($id);

        return $group;
    }
}

1;
