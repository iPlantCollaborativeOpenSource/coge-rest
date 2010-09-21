package CoGe::REST::Handler;

use warnings;
use strict;

use Apache2::REST::Handler;

use base 'Apache2::REST::Handler';

sub GET {
    my ( $self, $request, $response ) = @_;
    $request->requestedFormat('json');
    return;
}

sub isAuth {
    my ( $self, $method, $request ) = @_;
    return $method eq 'GET' ? 1 : 0;
}

1;
