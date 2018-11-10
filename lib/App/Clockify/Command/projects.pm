package App::Clockify::Command::projects;

use App::Clockify --command;
use App::Clockify::Base;

sub abstract {
  'projects';
}

sub description {
  'Work with Clockify projects';
}

sub opt_spec {
  return (
    ['list|l',   'List all projects'],
    ['create|c', 'Create a new project'],
  );
}

sub validate_args {
  my ($self, $opt, $args) = @_;
}

sub execute {
  my ($self, $opt, $args) = @_;
}

1;
