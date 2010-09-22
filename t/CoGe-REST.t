#!/usr/bin/perl

use warnings;
use strict;


#########################

use Test::More tests => 29;
BEGIN { use_ok('CoGe::Format') };
BEGIN { use_ok('CoGe::Format::Dataset') };
BEGIN { use_ok('CoGe::Format::Genome') };
BEGIN { use_ok('CoGe::Format::GenomicSequence') };
BEGIN { use_ok('CoGe::Format::GenomicSequenceType') };
BEGIN { use_ok('CoGe::Format::Organism') };
BEGIN { use_ok('CoGe::REST') };
BEGIN { use_ok('CoGe::REST::API') };
BEGIN { use_ok('CoGe::REST::AbstractObjectGetter') };
BEGIN { use_ok('CoGe::REST::AbstractObjectListGetter') };
BEGIN { use_ok('CoGe::REST::AbstractSearch') };
BEGIN { use_ok('CoGe::REST::Handler') };
BEGIN { use_ok('CoGe::REST::API::get') };
BEGIN { use_ok('CoGe::REST::API::get::dataset') };
BEGIN { use_ok('CoGe::REST::API::get::dataset::id') };
BEGIN { use_ok('CoGe::REST::API::get::genome') };
BEGIN { use_ok('CoGe::REST::API::get::genome::id') };
BEGIN { use_ok('CoGe::REST::API::get::genome::id::genomic_sequences') };
BEGIN { use_ok('CoGe::REST::API::get::genome::id::datasets') };
BEGIN { use_ok('CoGe::REST::API::get::genomic_sequence_type') };
BEGIN { use_ok('CoGe::REST::API::get::genomic_sequence_type::id') };
BEGIN { use_ok('CoGe::REST::API::get::organism') };
BEGIN { use_ok('CoGe::REST::API::get::organism::id') };
BEGIN { use_ok('CoGe::REST::API::get::organism::id::current_genome') };
BEGIN { use_ok('CoGe::REST::API::get::organism::id::genomes') };
BEGIN { use_ok('CoGe::REST::API::search') };
BEGIN { use_ok('CoGe::REST::API::search::organisms') };
BEGIN { use_ok('CoGe::REST::API::search::organisms::by_name') };
BEGIN { use_ok('CoGe::REST::API::search::organisms::by_description') };

#########################

