package WWW::Clockify::Project;

use Moose;

with 'WWW::Clockify::Role::API';

has '_path' => (
  is      => 'ro',
  isa     => 'Str',
  default => '/workspaces/',
);

has 'name' => (
  is  => 'ro',
  isa => 'Str',
);

has 'id' => (
  is  => 'ro',
  isa => 'Int',
);

sub all ($class) {
  my $self = $class->new();
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
