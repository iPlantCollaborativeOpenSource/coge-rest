package CoGe::REST::API::get::organism::id::current_genome;

use warnings;
use strict;

use Class::Std::Utils;
use CoGe::Format::Genome;
use CoGe::REST::AbstractObjectGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $parent, $id ) = @_;

        # Create the formatter used to format obects that we retrieve.
        my $formatter = CoGe::Format::Genome->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $parent, $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($organism) = $coge->resultset('Organism')->find($id);

        return defined $organism ? $organism->current_genome() : undef;
    }
}

1;
