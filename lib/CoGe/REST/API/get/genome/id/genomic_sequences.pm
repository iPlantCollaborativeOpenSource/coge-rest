package CoGe::REST::API::get::genome::id::genomic_sequences;

use warnings;
use strict;

use CoGe::Format::GenomicSequence;
use CoGe::REST::AbstractObjectListGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectListGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::GenomicSequence->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_objects {
        my ( $self, $id ) = @_;

        # Fetch the dataset group.
        my $coge   = CoGeX->dbconnect();
        my $genome = $coge->resultset('DatasetGroup')->find($id);
        return if !defined $genome;

        # Return the list of genomic sequences.
        return [ $genome->genomic_sequences() ];
    }
}

1;
