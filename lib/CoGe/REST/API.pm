package CoGe::REST::API;

use warnings;
use strict;

use CoGe::REST::Handler;

use base 'CoGe::REST::Handler';

sub GET {
    my ( $self, $request, $response ) = @_;
    $self->SUPER::GET();
    $response->data()->{'api_mess'} = "Welcome to CoGe!\n";
    return Apache2::Const::HTTP_OK;
}

1;
