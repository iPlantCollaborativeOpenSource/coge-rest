package CoGe::REST::API::get::annotation_type;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::annotation_type::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::annotation_type::id->new( $frag );
}

1;
