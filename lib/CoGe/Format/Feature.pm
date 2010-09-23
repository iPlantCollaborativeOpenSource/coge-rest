package CoGe::Format::Feature;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'feature_url'      => '/coge/get/feature/${feature_id}',
    'feature_type_url' => '/coge/get/feature_type/${feature_type_id}',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
