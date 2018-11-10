#!/usr/bin/env perl

use FindBin;
BEGIN {
  unshift @INC, "$FindBin::Bin/../lib";
  unshift @INC, "$FindBin::Bin/t";
};

use Test::WWW::Clockify;
Test::WWW::Clockify->runtests;
