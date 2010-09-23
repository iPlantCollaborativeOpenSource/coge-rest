package CoGe::REST::API::get::annotation_type_group;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::annotation_type_group::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::annotation_type_group::id->new( $frag );
}

1;
