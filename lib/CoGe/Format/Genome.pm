package CoGe::Format::Genome;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my $GENOME        => '/coge/get/genome';
Readonly my $SEQUENCE_TYPE => '/coge/get/genomic_sequence_type';

Readonly my %URL_PATTERN_FOR => (
    'genome_url'        => $GENOME . '/${dataset_group_id}',
    'sequence_type_url' => $SEQUENCE_TYPE . '/${genomic_sequence_type_id}',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
