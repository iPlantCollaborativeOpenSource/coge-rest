package CoGe::REST::API::get::feature::id::sequences;

use warnings;
use strict;

use CoGe::Format::Sequence;
use CoGe::REST::AbstractObjectListGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectListGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::Sequence->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_objects {
        my ( $self, $id ) = @_;

        # Fetch the feature.
        my $coge    = CoGeX->dbconnect();
        my $feature = $coge->resultset('Feature')->find($id);
        return if !defined $feature;

        # Return the list of sequences.
        return [ $feature->sequences() ];
    }
}

1;
