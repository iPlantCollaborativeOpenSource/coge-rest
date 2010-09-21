package CoGe::REST::API::get;

use warnings;
use strict;

use CoGe::REST::Handler;

use base 'CoGe::REST::Handler';

sub GET {
    my ( $self, $request, $response ) = @_;
    $self->SUPER::GET( $request, $response );
    $response->data()->{'api_mess'} = "Welcome to CoGe!\n";
    return Apache2::Const::HTTP_OK;
}

1;
