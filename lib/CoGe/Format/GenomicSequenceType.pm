package CoGe::Format::GenomicSequenceType;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my $GENOMIC_SEQUENCE_TYPE =>
    '/coge/get/genomic_sequence_type/${genomic_sequence_type_id}';

Readonly my $GENOMES =>
    '/coge/get/genomic_sequence_type/${genomic_sequence_type_id}/genomes';

Readonly my %URL_PATTERN_FOR => (
    'genomes_url'               => $GENOMES,
    'genomic_sequence_type_url' => $GENOMIC_SEQUENCE_TYPE,
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
