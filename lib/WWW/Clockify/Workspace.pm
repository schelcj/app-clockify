package WWW::Clockify::Workspace;

use Moose;

with 'WWW::Clockify::API';

has '_path' => (
  is      => 'ro',
  isa     => 'Str',
  default => 'workspaces/',
);

has 'id' => (
  is  => 'ro',
  isa => 'Str',
);

sub url ($self) {
  return $self->base_url->path($self->_path);
}

sub all ($self) {
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
