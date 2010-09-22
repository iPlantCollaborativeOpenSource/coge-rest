package CoGe::REST::API::get::data_source;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::data_source::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::data_source::id->new( $frag );
}

1;
