package WWW::Clockify::Role::Config;

use Modern::Perl;

use Moose::Role;
use Moose::Util::TypeConstraints;

use Config::Tiny;
use List::MoreUtils qw(firstidx);

subtype 'FileOnDisk', as 'Str', where {defined $_ and -r $_ and -s _}, message {'missing, or invalid, config file'};

has 'api_key' => (
  is      => 'ro',
  isa     => 'Str',
  lazy    => 1,
  builder => '_build_api_key',
);

has '_config' => (
  is      => 'ro',
  isa     => 'HashRef',
  lazy    => 1,
  builder => '_build_config',
);

has '_config_file' => (
  is      => 'ro',
  isa     => 'FileOnDisk',
  lazy    => 1,
  builder => '_build_config_file',
);

has '_config_file_name' => (
  is      => 'ro',
  isa     => 'Str',
  default => 'clockify.conf',
);

sub _build_api_key($self) {
  return $ENV{CLOCKIFY_API_KEY} if $ENV{CLOCKIFY_API_KEY};
  return $self->_config->{_}->{api_key};
}

sub _build_config_file($self) {
  my @files = (
    File::Spec->join($ENV{XDG_CONFIG_DIR}, $self->_config_file_name),
    File::Spec->join($ENV{HOME}, '.' . $self->_config_file_name)
  );

  my $idx = firstidx {-e $_} @files;

  return if $idx < 0;
  return $files[$idx];
}

sub _config($self) {
  return Config::Tiny->read($self->_config_file);
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
