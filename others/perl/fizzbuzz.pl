#!/usr/bin/env perl6

my @n = 1..100;

for @n -> $num {
  if $num %% 15 {
    print "Fizzbuzz, ";
  } elsif $num %% 5 {
    print "Buzz, ";
  } elsif $num %% 3 {
    print "Fizz, ";
  } else {
    print "$num. ";
  }
}
