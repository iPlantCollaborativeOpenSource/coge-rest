package CoGe::REST::API::get::organism::id::genomes;

use warnings;
use strict;

use Class::Std::Utils;
use CoGe::REST::Handler;
use CoGeX;

use base 'CoGe::REST::Handler';
{
    my %parent_of;
    my %organism_id_of;

    sub new {
        my ( $class, $parent, $organism_id ) = @_;
        my $self = $class->SUPER::new();

        $parent_of{ ident $self}      = $parent;
        $organism_id_of{ ident $self} = $organism_id;

        return $self;
    }

    sub DESTROY {
        my ($self) = @_;
        delete $parent_of{ ident $self};
        delete $organism_id_of{ ident $self};
    }

    sub GET {
        my ( $self, $request, $response ) = @_;
        $self->SUPER::GET( $request, $response );

        my $organism_id = $organism_id_of{ ident $self };

        my $coge = CoGeX->dbconnect();

        my ($organism) = $coge->resultset("Organism")->find($organism_id);
        if ( defined $organism ) {
            $response->data()->{'item'} = [
                map {
                    { $_->get_columns() }
                    } grep { $_->version() >= 0 } $organism->dataset_groups()
            ];
        }

        use Data::Dumper;
        $request->warn( Dumper $request );

        my $status_code
            = defined $organism
            ? Apache2::Const::HTTP_OK
            : Apache2::Const::NOT_FOUND;
    }

    sub isAuth {
        my ( $self, $method, $request ) = @_;
        return $method eq 'GET' ? 1 : 0;
    }
}

1;
