package CoGe::Format::Feature;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'annotations_url'   => '/coge/get/feature/${feature_id}/annotations',
    'feature_names_url' => '/coge/get/feature/${feature_id}/feature_names',
    'feature_type_url'  => '/coge/get/feature_type/${feature_type_id}',
    'feature_url'       => '/coge/get/feature/${feature_id}',
    'locations_url'     => '/coge/get/feature/${feature_id}/locations',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
