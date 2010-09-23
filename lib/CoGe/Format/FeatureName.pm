package CoGe::Format::FeatureName;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my $FEATURE => '/coge/get/feature/';

Readonly my $FEATURE_NAME => '/coge/get/feature_name/';

Readonly my %URL_PATTERN_FOR => (
    'annotation_url'   => $FEATURE_NAME . '${feature_name_id}/annotation',
    'feature_url'      => $FEATURE . '${feature_id}',
    'feature_name_url' => $FEATURE_NAME . '${feature_name_id}',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
