package CoGe::REST::API::get::annotation;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::annotation::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::annotation::id->new( $frag );
}

1;
