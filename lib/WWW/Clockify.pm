package WWW::Clockify;

use Moose;

has '_projects' => (
  traits   => ['Array'],
  is       => 'rw',
  isa      => 'ArrayRef[WWW::Clockify::Project]',
  lazy     => 1,
  builder  => '_build_projects',
  handlers => {
    projects       => 'elements',
    add_project    => 'push',
    find_project   => 'grep',
    has_project    => 'count',
    total_projects => 'count',
  }
);

sub _build_projects ($self) {
  my $projects = WWW::Clockify::Project->all();
  for (@{$projects}) {
    $self->add_project($_);
  }
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
