#!/usr/bin/env perl

use FindBin;
BEGIN {
  unshift @INC, "$FindBin::Bin/../lib";
  unshift @INC, "$FindBin::Bin/tests";
};

use Test::WWW::Clockify;
Test::WWW::Clockify->runtests;
