package Test::WWW::Clockify;

use parent 'Test::Class';

use Test::More;

sub class {
  return 'WWW::Clockify';
}

sub setup : Test(setup) {
  my $t = shift;
  $t->{api} = $t->class->new();
}

sub teardown : Test(teardown) {
  my $t = shift;
  $t->{api} = undef;
}

sub test_projects : Test(no_plan) {
  my $t = shift;
  my $api = $t->{api};
  is($api->total_projects, 1, 'found a project');
}

1;
