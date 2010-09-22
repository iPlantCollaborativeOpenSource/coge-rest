package CoGe::Format::Organism;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'organism_url' => '/coge/get/organism/${organism_id}',
    'genomes_url'  => '/coge/get/organism/${organism_id}/genomes',
);

use base 'CoGe::Format';
{
    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
