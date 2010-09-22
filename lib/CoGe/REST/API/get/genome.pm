package CoGe::REST::API::get::genome;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::genome::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::genome::id->new( $frag );
}

1;
