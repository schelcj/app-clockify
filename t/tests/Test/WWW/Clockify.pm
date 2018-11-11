package Test::WWW::Clockify;

use parent 'Test::Class';

use Test::More;

sub class {
  (my $class = __PACKAGE__) =~ s/Test:://g;
  return $class;
}

sub setup : Test(setup) {
  my $t = shift;
  $t->{api} = $t->class->new();
}

sub teardown : Test(teardown) {
  my $t = shift;
  $t->{api} = undef;
}

1;
