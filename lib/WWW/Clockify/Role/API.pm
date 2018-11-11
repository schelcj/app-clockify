package WWW::Clockify::Role::API;

use Modern::Perl;

use Moose::Role;

use Mojo::URL;
use Mojo::UserAgent;

has 'api_key' => (
  is      => 'rw',
  isa     => 'Str',
  lazy    => 1,
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
  lazy    => 1,
  builder => '_build_agent',
);

has 'workspace_id' => (
  is  => 'rw',
  isa => 'Str',
);

has '_res' => (
  is  => 'rw',
  isa => 'HashRef',
);

sub _build_agent ($self) {
  my $agent = Mojo::UserAgent->new();

  $agent->on(
    start => sub {
      my ($ua, $tx) = @_;

      $tx->req->headers->header('X-Api-Key'    => $self->api_key);
      $tx->req->headers->header('Content-Type' => 'application/json');
      $tx->req->headers->header('Accept'       => 'application/json');
    }
  );

  return $agent;
}

sub _build_base_url ($self) {
  return Mojo::URL->new('https://api.clockify.me/api');
}

sub get ($self) {
  my $res = $self->agent->get($self->url);
  if ($res->is_error) {
    # TODO
  }

  $self->_res($res->result);

  return $res->result->json;
}

sub post ($self) {
}

sub put ($self) {
}

sub delete ($self) {
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
