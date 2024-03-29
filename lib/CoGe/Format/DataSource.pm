package CoGe::Format::DataSource;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'data_source_url' => '/coge/get/data_source/${data_source_id}',
    'datasets_url'    => '/coge/get/data_source/${data_source_id}/datasets',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
