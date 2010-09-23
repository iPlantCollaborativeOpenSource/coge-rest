package CoGe::Format::AnnotationTypeGroup;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my $ANNOTATION_TYPE_GROUP =>
    '/coge/get/annotation_type_group/${annotation_type_group_id}';

Readonly my %URL_PATTERN_FOR => (
    'annotation_type_group_url' => $ANNOTATION_TYPE_GROUP,
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
