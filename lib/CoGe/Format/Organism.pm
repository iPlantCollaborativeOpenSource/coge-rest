package CoGe::Format::Organism;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my $ORGANISM => '/coge/get/organism/${organism_id}';

Readonly my %URL_PATTERN_FOR => (
    'datasets_url'       => $ORGANISM . '/datasets',
    'genomes_url'        => $ORGANISM . '/genomes',
    'organism_url'       => $ORGANISM,
    'sequence_types_url' => $ORGANISM . '/genomic_sequence_types',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
