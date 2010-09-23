package CoGe::REST::API::get::feature_name;

use warnings;
use strict;

use CoGe::REST::Handler;
use CoGe::REST::API::get::feature_name::id;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $frag, $req ) = @_;
    return CoGe::REST::API::get::feature_name::id->new( $frag );
}

1;
