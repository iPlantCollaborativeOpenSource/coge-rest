package CoGe::Format::Organism;

use warnings;
use strict;

use Apache2::URI;
use Apache2::REST::Handler;
use Class::Std::Utils;
use Readonly;

Readonly my %URL_PATTERN_FOR => (
    'organism_url' => '/coge/get/organism/${organism_id}',
    'genomes_url'  => '/coge/get/organism/${organism_id}/genomes',
);

use interface 'CoGe::Format';
use base 'Apache2::REST::Handler';
{
    sub new {
        my ($class) = @_;

        # Create the new object instance.
        my $self = bless anon_scalar(), $class;

        return $self;
    }
    
    sub build_hash {
        my ( $self, $request, $organism_ref ) = @_;

        # Build the initial hash.
        my %hash = $organism_ref->get_columns();

        # Add any URLs that we're supposed to define.
        for my $url_name ( keys %URL_PATTERN_FOR ) {
            my $url = $URL_PATTERN_FOR{$url_name};
            $url =~ s/ \$ \{ ([^}]+) \} /$hash{$1}/cgxms;
            $hash{$url_name} = $request->construct_url($url);
        }

        return \%hash;
    }
}

1;
