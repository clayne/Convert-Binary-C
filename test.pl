#!/usr/bin/perl -w
################################################################################
#
# $Project: /Convert-Binary-C $
# $Author: mhx $
# $Date: 2008/04/15 14:37:47 +0100 $
# $Revision: 7 $
# $Source: /test.pl $
#
################################################################################
#
# Copyright (c) 2005-2008 Marcus Holland-Moritz. All rights reserved.
# This program is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
################################################################################

BEGIN {
  $only_basic = $] < 5.005;

  if ($only_basic) {
    print STDERR <<ENDWARN;

--> WARNING: The version of perl you're using ($]) is very old.
-->
-->   The complete test suite cannot be run with perl < 5.005.
-->
-->   I will only run some very basic tests now.

ENDWARN
    eval q{
      use Test::Harness;
      
      $Test::Harness::switches = "-w";
    };
  }
  else {
    eval q{
      use lib './support';
      use File::Spec;
      use Test::Harness;
      use Cwd;

      $lib = File::Spec->catfile(getcwd, 'support');
      $lib = qq["$lib"] if $lib =~ /\s/;
      
      $Test::Harness::switches = "-I $lib -w";
    };
  }
}

@tests = @ARGV ? @ARGV : find_tests();
die "*** Can't find any test files\n" unless @tests;

$ENV{PERL_DL_NONLAZY} = 1;

runtests(@tests);

sub find_tests
{
  use File::Find;
  my $fd = $only_basic ? '1' : $ENV{ONLY_FAST_TESTS} ? '[0123478]' : '\d';
  my %t;
  find(sub { -f and /^$fd\d{2}_\w+\.t$/ and $t{$File::Find::name}++ }, 'tests');
  return sort keys %t;
}
