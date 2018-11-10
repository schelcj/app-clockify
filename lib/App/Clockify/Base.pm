package App::Clockify::Base;

use base 'Import::Base';

our @IMPORT_MODULES = (
  qw(
    Modern::Perl
  )
);

our %IMPORT_BUNDLES = (
  www => [
    qw(Mojo::UserAgent)
  ]
);

1;
