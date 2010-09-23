package CoGe::REST::API::get::feature::id::locations;

use warnings;
use strict;

use CoGe::Format::Location;
use CoGe::REST::AbstractObjectListGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectListGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::Location->new();
        
        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_objects {
        my ( $self, $id ) = @_;

        # Fetch the feature.
        my $coge   = CoGeX->dbconnect();
        my $feature = $coge->resultset('Feature')->find($id);
        return if !defined $feature;

        # Return the list of locations.
        return [ $feature->locations() ];
    }
}

1;
