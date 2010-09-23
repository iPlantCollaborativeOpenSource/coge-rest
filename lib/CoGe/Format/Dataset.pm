package CoGe::Format::Dataset;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my $DATA_SOURCE => '/coge/get/data_source/';
Readonly my $DATASET     => '/coge/get/dataset/';

Readonly my %URL_PATTERN_FOR => (
    'dataset_url'         => $DATASET . '${dataset_id}',
    'data_source_url'     => $DATA_SOURCE . '${data_source_id}',
    'feature_summary_url' => $DATASET . '${dataset_id}/feature_summary',
    'features_url'        => $DATASET . '${dataset_id}/features',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
