package CoGe::Format::SequenceType;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'sequence_type_url' => '/coge/get/sequence_type/${sequence_type_id}',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
