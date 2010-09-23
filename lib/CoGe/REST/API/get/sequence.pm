package CoGe::REST::API::get::sequence;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::sequence::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::sequence::id->new( $frag );
}

1;
