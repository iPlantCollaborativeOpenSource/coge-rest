package CoGe::REST::API::get::sequence_type::id;

use warnings;
use strict;

use CoGe::Format::SequenceType;
use CoGe::REST::AbstractObjectGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter for objects that we fetch.
        my $formatter = CoGe::Format::SequenceType->new();

        # Create the class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($sequence_type) = $coge->resultset('SequenceType')->find($id);

        return $sequence_type;
    }
}

1;
