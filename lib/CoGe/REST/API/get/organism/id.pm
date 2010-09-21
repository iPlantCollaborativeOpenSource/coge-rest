package CoGe::REST::API::get::organism::id;

use warnings;
use strict;

use Apache2::Log;
use Apache2::Const -compile => qw(OK :log);
use APR::Const -compile     => qw(:error SUCCESS);
use Class::Std::Utils;
use CoGe::Format::Organism;
use CoGe::REST::Handler;
use CoGe::REST::API::get::organism::id::current_genome;
use CoGe::REST::API::get::organism::id::genomes;
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
            my $format = CoGe::Format::Organism->new();
            $response->data()->{'item'}
                = $format->build_hash( $request, $organism );
        }

        my $status_code
            = defined $organism
            ? Apache2::Const::HTTP_OK
            : Apache2::Const::NOT_FOUND;
    }

    sub buildNext {
        my ( $self, $frag, $req ) = @_;
        my $package = "CoGe::REST::API::get::organism::id::$frag";
        return $package->new( $self, $organism_id_of{ ident $self } );
    }
}

1;
