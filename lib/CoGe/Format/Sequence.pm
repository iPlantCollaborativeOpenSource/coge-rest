package CoGe::Format::Sequence;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'sequence_url' => '/coge/get/sequence/${sequence_id}',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
