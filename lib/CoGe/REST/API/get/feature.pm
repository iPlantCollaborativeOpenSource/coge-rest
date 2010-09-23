package CoGe::REST::API::get::feature;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::feature::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::feature::id->new( $frag );
}

1;
