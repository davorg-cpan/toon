use strict;
use warnings;

use Test::More;
use TOON;

my $text = do { local $/; <DATA> };

my $toon = TOON->new;

ok(my $data = $toon->decode($text));

done_testing;

__DATA__
users[2]{id,name,role}:
  1,Alice,admin
  2,Bob,user
