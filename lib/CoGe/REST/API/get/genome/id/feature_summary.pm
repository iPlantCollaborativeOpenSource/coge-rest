package CoGe::REST::API::get::genome::id::feature_summary;

use warnings;
use strict;

use CoGe::Format::FeatureSummary;
use CoGe::REST::AbstractObjectListGetter;
use CoGeX;

use base 'CoGe::REST::AbstractObjectListGetter';
{

    sub new {
        my ( $class, $id ) = @_;

        # Create the formatter used to format objects that we fetch.
        my $formatter = CoGe::Format::FeatureSummary->new();

        # Create the new class instance.
        my $self = $class->SUPER::new( $id, $formatter );

        return $self;
    }

    sub get_objects {
        my ( $self, $id ) = @_;

        # Fetch the feature summary information.
        my $coge    = CoGeX->dbconnect();
        my @results = $coge->resultset('GenomeFeatureSummary')
            ->search( {}, { 'bind' => [$id] } );

        # Return the list of features.
        return \@results;
    }
}

1;
