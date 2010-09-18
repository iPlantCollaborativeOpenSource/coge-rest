package CoGe::REST::API::search::organisms::search;

use warnings;
use strict;

use Class::Std::Utils;
use CoGe::REST::Handler;
use CoGeX;
use CoGeX::ResultSet::Organism;

use base 'CoGe::REST::Handler';
{
    my %parent_of;
    my %search_string_of;

    sub new {
        my ( $class, $parent, $search_string ) = @_;
        my $self = $class->SUPER::new();

        $parent_of{ ident $self}        = $parent;
        $search_string_of{ ident $self} = $search_string;

        return $self;
    }

    sub DESTROY {
        my ($self) = @_;
        delete $parent_of{ ident $self};
        delete $search_string_of{ ident $self};
    }

    sub GET {
        my ( $self, $request, $response ) = @_;
        $self->SUPER::GET( $request, $response );

        my $search_string = $search_string_of{ ident $self };

        my $coge      = CoGeX->dbconnect();
        my @organisms = $coge->resultset('Organism')->resolve($search_string);

        $response->data()->{'item'}
            = [ map { { $_->get_columns() } } @organisms ];

        return Apache2::Const::HTTP_OK;
    }

    sub isAuth {
        my ( $self, $method, $request ) = @_;
        return $method eq 'GET' ? 1 : 0;
    }
}

1;
