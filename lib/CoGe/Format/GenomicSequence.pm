package CoGe::Format::GenomicSequence;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my $GENOMIC_SEQUENCE =>
    '/coge/get/genomic_sequence/${genomic_sequence_id}';

Readonly my $GENOME => '/coge/get/genome/${dataset_group_id}';

Readonly my %URL_PATTERN_FOR => (
    'genome_url'           => $GENOME,
    'genomic_sequence_url' => $GENOMIC_SEQUENCE,
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
