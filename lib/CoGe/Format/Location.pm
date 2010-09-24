package CoGe::Format::Location;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'feature_url'  => '/coge/get/feature/${feature_id}',
    'location_url' => '/coge/get/location/${location_id}',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
