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

sub list ($self) {
}

sub create ($self) {
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
