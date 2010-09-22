package CoGe::REST::AbstractObjectListGetter;

use warnings;
use strict;

use Class::Std::Utils;
use CoGe::REST::Handler;
use CoGeX;

use base 'CoGe::REST::Handler';
{
    my %id_of;
    my %formatter_of;

    sub new {
        my ( $class, $id, $formatter ) = @_;

        # Create the new class instance.
        my $self = $class->SUPER::new();

        # Store the attribute values.
        $id_of{ ident $self}        = $id;
        $formatter_of{ ident $self} = $formatter;

        return $self;
    }

    sub DESTROY {
        my ($self) = @_;

        # Delete the attribute values.
        delete $id_of{ ident $self};
        delete $formatter_of{ ident $self};

        return;
    }

    sub GET {
        my ( $self, $request, $response ) = @_;
        $self->SUPER::GET( $request, $response );

        # Get the object identifier.
        my $id = $id_of{ ident $self };

        # Fetch the object list.
        my $objects_ref = $self->get_objects($id);

        if ( defined $objects_ref ) {
            my $format = $formatter_of{ ident $self };
            $response->data()->{'item'} = [
                map { $format->build_hash( $request, $_ ) } @{$objects_ref}
            ];
        }

        my $status_code
            = defined $objects_ref
            ? Apache2::Const::HTTP_OK
            : Apache2::Const::NOT_FOUND;
    }
}

1;
