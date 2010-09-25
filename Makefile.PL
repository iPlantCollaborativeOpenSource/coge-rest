use 5.008000;
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'CoGe::REST',
    VERSION_FROM => 'lib/CoGe/REST.pm',    # finds $VERSION
    PREREQ_PM    => {
        'Apache2::REST'              => 0,
        'Apache2::REST::Handler'     => 0,
        'Apache2::URI'               => 0,
        'Class::Std::Utils'          => 0,
        'CoGeX'                      => 0,
        'CoGeX::ResultSet::Organism' => 0,
        'Readonly'                   => 0,
        'Test::More'                 => 0,
    },
    (   $] >= 5.005
        ?    ## Add these new keywords supported since 5.005
            (
            ABSTRACT_FROM =>
                'lib/CoGe/REST.pm',    # retrieve abstract from module
            AUTHOR => 'Dennis Roberts <dennis@iplantcollaborative.org>'
            )
        : ()
    ),
);
