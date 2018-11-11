package WWW::Clockify;

use Moose;

has '_workspaces' => (
  traits  => ['Array'],
  is      => 'rw',
  isa     => 'ArrayRef[WWW::Clockify::Workspace]',
  lazy    => 1,
  builder => '_build_workspaces',
  handles => {
    workspaces       => 'elements',
    add_workspace    => 'push',
    find_workspace   => 'grep',
    has_workspace    => 'count',
    total_workspaces => 'count',
    first_workspace  => 'shift',
  },
);

has '_projects' => (
  traits  => ['Array'],
  is      => 'rw',
  isa     => 'ArrayRef[WWW::Clockify::Project]',
  lazy    => 1,
  builder => '_build_projects',
  handles => {
    projects       => 'elements',
    add_project    => 'push',
    find_project   => 'grep',
    has_project    => 'count',
    total_projects => 'count',
  }
);

sub _build_workspaces ($self) {
  for (WWW::Clockify::Workspace->all()) {
    $self->add_workspace($_);
  }
}

sub _build_projects ($self) {
  for (WWW::Clockify::Project->all) {
    $self->add_project($_);
  }
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
