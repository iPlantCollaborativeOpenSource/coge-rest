package CoGe::REST::API::get::annotation_type::id;

use warnings;
use strict;

use CoGe::Format::AnnotationType;
use CoGe::REST::AbstractObjectGetter;
use CoGe::REST::API::get::annotation_type::id::annotations;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter for objects that we fetch.
        my $formatter = CoGe::Format::AnnotationType->new();

        # Create the class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($annotation_type) = $coge->resultset('AnnotationType')->find($id);

        return $annotation_type;
    }
}

1;
