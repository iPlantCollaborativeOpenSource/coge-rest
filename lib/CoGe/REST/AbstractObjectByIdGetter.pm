package CoGe::REST::AbstractObjectByIdGetter;

use warnings;
use strict;

use CoGe::REST::Handler;

use base 'CoGe::REST::Handler';

sub buildNext {
    my ( $self, $id, $req ) = @_;

    # Determine the package of the next handler in the chain.
    my $current_package = ref $self;
    my $next_package    = "${current_package}::id";

    # Instantiate and return the next handler.
    return $next_package->new($id);
}

1;
