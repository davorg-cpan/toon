package TOON::Error;

use v5.40;
use feature 'signatures';
use overload '""' => 'as_string', fallback => 1;

sub new ($class, %args) {
  return bless {
    message => $args{message} // 'Unknown TOON error',
    line    => $args{line}    // 1,
    column  => $args{column}  // 1,
    offset  => $args{offset}  // 0,
  }, $class;
}

sub message ($self) { return $self->{message} }
sub line    ($self) { return $self->{line} }
sub column  ($self) { return $self->{column} }
sub offset  ($self) { return $self->{offset} }

sub as_string ($self, @) {
  return sprintf '%s at line %d, column %d',
    $self->{message}, $self->{line}, $self->{column};
}

1;
