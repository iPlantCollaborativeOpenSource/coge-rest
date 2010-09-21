package CoGe::REST::API::search::organisms::by_description;

use warnings;
use strict;

use CoGe::Format::Organism;
use CoGe::REST::AbstractSearch;
use CoGeX;
use CoGeX::ResultSet::Organism;
use Readonly;

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

        # Set up the search criteria.
        my %criteria
            = ( 'description' => { '-like' => "\%$search_string\%" } );

        # Find matching organisms.
        my $coge = CoGeX->dbconnect();
        return $coge->resultset('Organism')->search(\%criteria);
    }
}

1;

