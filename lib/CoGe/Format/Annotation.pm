package CoGe::Format::Annotation;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my $ANNOTATION      => '/coge/get/annotation/';
Readonly my $ANNOTATION_TYPE => '/coge/get/annotation_type/';
Readonly my $FEATURE         => '/coge/get/feature/';

Readonly my %URL_PATTERN_FOR => (
    'annotation_type_url' => $ANNOTATION_TYPE . '${annotation_type_id}',
    'annotation_url'      => $ANNOTATION . '${annotation_id}',
    'feature_url'         => $FEATURE . '${feature_id}',
    'feature_name_url'    => $ANNOTATION . '${annotation_id}/feature_name',
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
