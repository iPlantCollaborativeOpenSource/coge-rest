package CoGe::REST::API::get::sequence_type;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::sequence_type::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::sequence_type::id->new( $frag );
}

1;
