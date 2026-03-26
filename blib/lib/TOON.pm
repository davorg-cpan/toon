package TOON;

use v5.40;
use feature 'signatures';

use Exporter 'import';
use TOON::PP ();

our $VERSION   = '0.0.1';
our @EXPORT_OK = qw(
  encode_toon decode_toon
  to_toon from_toon
);

sub encode_toon ($data, %opts) {
  return TOON::PP->new(%opts)->encode($data);
}

sub decode_toon ($text, %opts) {
  return TOON::PP->new(%opts)->decode($text);
}

sub to_toon   ($data, %opts) { return encode_toon($data, %opts) }
sub from_toon ($text, %opts) { return decode_toon($text, %opts) }

sub new ($class, %opts) {
  return bless {
    pretty    => $opts{pretty}    // 0,
    canonical => $opts{canonical} // 0,
    indent    => $opts{indent}    // 2,
  }, $class;
}

sub encode ($self, $data) {
  return TOON::PP->new(%$self)->encode($data);
}

sub decode ($self, $text) {
  return TOON::PP->new(%$self)->decode($text);
}

sub pretty ($self, $value = 1) {
  $self->{pretty} = $value;
  return $self;
}

sub canonical ($self, $value = 1) {
  $self->{canonical} = $value;
  return $self;
}

sub indent ($self, $value) {
  $self->{indent} = $value if defined $value;
  return $self;
}

1;

__END__

=head1 NAME

TOON - Token-Oriented Object Notation for Perl

=head1 SYNOPSIS

  use TOON qw(encode_toon decode_toon);

  my $text = encode_toon({ answer => 42, active => 1 });
  my $data = decode_toon($text);

=head1 DESCRIPTION

This is a small pure-Perl starter implementation of a TOON encoder/decoder
with an interface inspired by JSON.

This version supports a pragmatic TOON syntax:

=over 4

=item * scalars: null, true, false, numbers, quoted strings

=item * arrays: [ ... ]

=item * objects: { key: value }

=item * bareword object keys consisting of C<[A-Za-z_][A-Za-z0-9_\-]*>

=back

Quoted strings use JSON-style escapes.

=head1 METHODS

=head2 new

=head2 encode

=head2 decode

=head2 pretty

=head2 canonical

=head2 indent

=head1 FUNCTIONS

=head2 encode_toon

=head2 decode_toon

=head2 to_toon

=head2 from_toon

=head1 AUTHOR

Dave Cross <dave@perlhacks.com>

=cut
