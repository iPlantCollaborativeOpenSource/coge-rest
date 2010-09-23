package CoGe::Format::AnnotationType;

use warnings;
use strict;

use CoGe::Format;
use Readonly;

Readonly my $ANNOTATIONS =>
    '/coge/get/annotation_type/${annotation_type_id}/annotations';

Readonly my $ANNOTATION_TYPE =>
    '/coge/get/annotation_type/${annotation_type_id}';

Readonly my $ANNOTATION_TYPE_GROUP =>
    '/coge/get/annotation_type_group/${annotation_type_group_id}';

Readonly my %URL_PATTERN_FOR => (
    'annotations_url'           => $ANNOTATIONS,
    'annotation_type_url'       => $ANNOTATION_TYPE,
    'annotation_type_group_url' => $ANNOTATION_TYPE_GROUP,
);

use base 'CoGe::Format';
{

    sub get_url_patterns {
        return \%URL_PATTERN_FOR;
    }
}

1;
