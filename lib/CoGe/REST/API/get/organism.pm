package CoGe::REST::API::get::organism;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::organism::id;

use base 'CoGe::REST::Handler';

sub isAuth {
    my ( $self, $method, $request ) = @_;
    return $method eq 'GET' ? 1 : 0;
}

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::organism::id->new( $self, $frag );
}

1;
