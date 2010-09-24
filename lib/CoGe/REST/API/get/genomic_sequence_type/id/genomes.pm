package CoGe::REST::API::get::genomic_sequence_type::id::genomes;

use warnings;
use strict;

use CoGe::Format::Genome;
use CoGe::REST::AbstractObjectListGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectListGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::Genome->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_objects {
        my ( $self, $id ) = @_;

        # Fetch the genomic sequence type.
        my $coge     = CoGeX->dbconnect();
        my $seq_type = $coge->resultset('GenomicSequenceType')->find($id);
        return if !defined $seq_type;

        # Return the list of genomes.
        return [ grep { $_->version() >= 0 } $seq_type->dataset_groups() ];
    }
}

1;
