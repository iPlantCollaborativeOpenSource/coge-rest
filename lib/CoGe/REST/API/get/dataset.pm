package CoGe::REST::API::get::dataset;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::dataset::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::dataset::id->new( $frag );
}

1;
