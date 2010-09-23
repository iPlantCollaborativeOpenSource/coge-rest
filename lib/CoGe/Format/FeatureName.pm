package CoGe::Format::FeatureName;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'feature_name_url' => '/coge/get/feature_name/${feature_name_id}',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
