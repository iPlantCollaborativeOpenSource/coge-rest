package CoGe::REST::API::get::genome::id;

use warnings;
use strict;

use CoGe::Format::Genome;
use CoGe::REST::AbstractObjectGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectGetter';
{
    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter for objects that we fetch.
        my $formatter = CoGe::Format::Genome->new();

        # Create the class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_object {
        my ( $self, $id ) = @_;

        # Find the matching object.
        my $coge = CoGeX->dbconnect();
        my ($genome) = $coge->resultset('DatasetGroup')->find($id);

        return $genome;
    }

    sub buildNext {
        my ( $self, $frag, $req ) = @_;

        # Determine the package of the next handler in the chain.
        my $current_package = ref $self;
        my $package = "${current_package}::$frag";
        
        return $package->new( $self->get_id() );
    }
}

1;
