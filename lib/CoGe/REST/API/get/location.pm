package CoGe::REST::API::get::location;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::location::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::location::id->new( $frag );
}

1;
