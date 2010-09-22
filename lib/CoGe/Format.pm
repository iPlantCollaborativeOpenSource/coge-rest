package CoGe::Format;

use warnings;
use strict;

use Apache2::URI;
use Apache2::REST::Handler;
use Class::Std::Utils;

use base 'Apache2::REST::Handler';
{
    sub new {
        my ($class) = @_;

        # Create the new object instance.
        my $self = bless anon_scalar(), $class;

        return $self;
    }

    sub build_hash {
        my ( $self, $request, $object_ref ) = @_;

        # Build the initial hash.
        my %hash = $object_ref->get_columns();

        # Add any URLs that we're supposed to define.
        my $url_pattern_for_ref = $self->get_url_patterns();
        for my $url_name ( keys %{$url_pattern_for_ref} ) {
            my $url = $url_pattern_for_ref->{$url_name};
            $url =~ s/ \$ \{ ([^}]+) \} /$hash{$1}/egxms;
            $hash{$url_name} = $request->construct_url($url);
        }

        return \%hash;
    }
}

1;
