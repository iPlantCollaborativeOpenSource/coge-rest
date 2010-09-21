package CoGe::REST::AbstractSearch;

use warnings;
use strict;

use Class::Std::Utils;
use CoGe::REST::Handler;

use base 'CoGe::REST::Handler';
{
    my %search_string_of;
    my %formatter_of;

    sub new {
        my ( $class, $parent, $search_string, $formatter ) = @_;

        # Create the new class instance.
        my $self = $class->SUPER::new();

        # Set the attributes.
        $search_string_of{ ident $self} = $search_string;
        $formatter_of{ ident $self} = $formatter;

        return $self;
    }

    sub DESTROY {
        my ($self) = @_;

        # Delete the attributes for the object being destroyed.
        delete $search_string_of{ ident $self};
    }

    sub GET {
        my ( $self, $request, $response ) = @_;
        $self->SUPER::GET( $request, $response );

        $request->warn("$self");

        # Fetch the search string.
        my $search_string = $search_string_of{ ident $self };
        return Apache2::Const::HTTP_BAD_REQUEST if !defined $search_string;

        # Perform the search.
        my @results = $self->perform_search($search_string);

        # Format the results.
        my $format = $formatter_of{ ident $self};
        my @formatted_results
            = map { $format->build_hash( $request, $_ ) } @results;
        $response->data()->{'item'} = \@formatted_results;

        return Apache2::Const::HTTP_OK
    }

    sub buildNext {
        my ( $self, $frag, $req ) = @_;
        my $package = ref $self;
        return $package->new( $self, $frag );
    }
}

1;
