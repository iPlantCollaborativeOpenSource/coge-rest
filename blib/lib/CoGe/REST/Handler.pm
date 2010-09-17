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

1;
