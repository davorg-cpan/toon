use strict;
use warnings;

use Test::More;
use TOON;

my $text = do { local $/; <DATA> };

my $toon = TOON->new;

ok(my $data = $toon->decode($text));

is($data->{users}->@*, 2, 'Two elements in array');
is($data->{users}[0]{name}, 'Alice');
is($data->{users}[1]{role}, 'user');

my $new_text = $toon->encode($data);

diag($new_text);
is($new_text, $text);

done_testing;

__DATA__
users[2]{id,name,role}:
  1,Alice,admin
  2,Bob,user
