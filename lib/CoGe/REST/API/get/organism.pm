package CoGe::REST::API::get::organism;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::organism::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::organism::id->new( $self, $frag );
}

1;
