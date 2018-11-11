package Test::WWW::Clockify::Workspace;

use parent 'Test::WWW::Clockify';

use Test::More;

sub test_all : Test(no_plan) {
  my $t = shift;
  my $api = $t->{api};

  can_ok($api, 'workspaces');
}

1;
