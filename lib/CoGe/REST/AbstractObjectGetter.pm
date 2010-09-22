package CoGe::REST::AbstractObjectGetter;

use warnings;
use strict;

use Class::Std::Utils;
use CoGe::REST::Handler;

use base 'CoGe::REST::Handler';
{
    my %id_of;
    my %formatter_of;

    sub get_id {
        my ($self) = @_;
        return $id_of{ ident $self};
    }

    sub new {
        my ( $class, $id, $formatter ) = @_;

        # Create the new class instance.
        my $self = $class->SUPER::new();

        # Set the attributes.
        $id_of{ ident $self} = $id;
        $formatter_of{ ident $self} = $formatter;

        return $self;
    }

    sub DESTROY {
        my ($self) = @_;

        # Delete the attributes.
        delete $id_of{ ident $self};
        delete $formatter_of{ ident $self};

        return;
    }

    sub GET {
        my ( $self, $request, $response ) = @_;
        $self->SUPER::GET( $request, $response );

        # Fetch the object ID.
        my $id = $id_of{ ident $self };

        # Fetch the object if it exists.
        my $object = $self->get_object($id);

        # Format the result if there is one.
        if ( defined $object ) {
            my $format = $formatter_of{ ident $self};
            $response->data()->{'item'}
                = $format->build_hash( $request, $object );
        }

        # Determine the status code.
        my $status_code
            = defined $object
            ? Apache2::Const::HTTP_OK
            : Apache2::Const::NOT_FOUND;

        return $status_code;
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
