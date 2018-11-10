package WWW::Clockify::Role::API;

use Modern::Perl;
use Moose::Role;
use Mojo::UserAgent;

has 'api_key' => (
  is      => 'ro',
  isa     => 'Str',
  default => sub {
    $ENV{CLOCKIFY_API_KEY};
  },
);

has 'base_url' => (
  is      => 'ro',
  isa     => 'Mojo::URL',
  lazy    => 1,
  builder => '_build_base_url',
);

has 'agent' => (
  is      => 'ro',
  isa     => 'Mojo::UserAgent',
  default => sub {
    Mojo::UserAgent->new();
  },
);

has 'workspace_id' => (
  is  => 'rw',
  isa => 'Str',
);

sub _build_base_url ($self) {
  return Mojo::URL->new('https://api.clockify.me/api');
}

sub get ($self) {
}

sub put ($self) {
}

sub delete ($self) {
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
