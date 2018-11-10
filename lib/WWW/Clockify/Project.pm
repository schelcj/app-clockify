package WWW::Clockify::Project;

use Moose;

with 'WWW::Clockify::Role::API';

no Moose;
__PACKAGE__->meta->make_immutable;

1;
