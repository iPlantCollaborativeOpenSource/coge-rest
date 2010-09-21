package CoGe::REST::API::search::organisms::by_name;

use warnings;
use strict;

use CoGe::Format::Organism;
use CoGe::REST::AbstractSearch;
use CoGeX;
use CoGeX::ResultSet::Organism;

use base 'CoGe::REST::AbstractSearch';
{

    sub new {
        my ( $class, $parent, $search_string ) = @_;

        # Create the formatter for this search.
        my $formatter = CoGe::Format::Organism->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $parent, $search_string, $formatter );

        return $self;
    }

    sub perform_search {
        my ( $self, $search_string ) = @_;

        # Find matching organisms.
        my $coge = CoGeX->dbconnect();
        return $coge->resultset('Organism')->resolve($search_string);
    }
}

1;

