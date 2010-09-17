package CoGe::REST::API::search::organisms;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::search::organisms::search;

use base 'CoGe::REST::Handler';

sub isAuth {
    my ( $self, $method, $request ) = @_;
    return $method eq 'GET' ? 1 : 0;
}

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::search::organisms::search->new( $self, $frag );
}

1;
