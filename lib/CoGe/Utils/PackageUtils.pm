package CoGe::Utils::PackageUtils;

use warnings;
use strict;

use File::Spec;

our @ISA = qw(Exporter);

our @EXPORT_OK = qw(require_package);

our $VERSION = '0.0.1';

sub require_package {
    my ($package) = @_;

    # Require the package.
    my $path = _package_to_path($package);
    require $path;

    return;
}

sub _package_to_path {
    my ($package) = @_;

    # Convert and return the package namne.
    return File::Spec->catfile( split m/::/xms, $package ) . '.pm';
}

1;
