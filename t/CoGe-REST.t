#!/usr/bin/perl

use warnings;
use strict;


#########################

use Test::More tests => 14;
BEGIN { use_ok('CoGe::REST') };
BEGIN { use_ok('CoGe::REST::API') };
BEGIN { use_ok('CoGe::REST::Handler') };
BEGIN { use_ok('CoGe::REST::API::get') };
BEGIN { use_ok('CoGe::REST::API::get::organism') };
BEGIN { use_ok('CoGe::REST::API::get::organism::id') };
BEGIN { use_ok('CoGe::REST::API::get::organism::id::current_genome') };
BEGIN { use_ok('CoGe::REST::API::get::organism::id::genomes') };
BEGIN { use_ok('CoGe::REST::API::search') };
BEGIN { use_ok('CoGe::REST::API::search::organisms') };
BEGIN { use_ok('CoGe::REST::API::search::organisms::by_name') };
BEGIN { use_ok('CoGe::REST::API::search::organisms::by_description') };
BEGIN { use_ok('CoGe::Format') };
BEGIN { use_ok('CoGe::Format::Organism') };

#########################

