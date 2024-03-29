package CoGe::Format::Sequence;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'feature_url'       => '/coge/get/feature/${feature_id}',
    'sequence_url'      => '/coge/get/sequence/${sequence_id}',
    'sequence_type_url' => '/coge/get/sequence_type/${sequence_type_id}',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
