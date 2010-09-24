package CoGe::REST::API::get::genomic_sequence_type::id;

use warnings;
use strict;

use CoGe::Format::GenomicSequenceType;
use CoGe::REST::AbstractObjectGetter;
use CoGe::REST::API::get::genomic_sequence_type::id::genomes;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter for objects that we fetch.
        my $formatter = CoGe::Format::GenomicSequenceType->new();

        # Create the class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($sequence) = $coge->resultset('GenomicSequenceType')->find($id);

        return $sequence;
    }
}

1;
