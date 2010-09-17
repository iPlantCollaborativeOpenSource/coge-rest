#!/usr/bin/perl

use warnings;
use strict;


#########################

use Test::More tests => 6;
BEGIN { use_ok('CoGe::REST') };
BEGIN { use_ok('CoGe::REST::API') };
BEGIN { use_ok('CoGe::REST::Handler') };
BEGIN { use_ok('CoGe::REST::API::search') };
BEGIN { use_ok('CoGe::REST::API::search::organisms') };
BEGIN { use_ok('CoGe::REST::API::search::organisms::search') };

#########################


