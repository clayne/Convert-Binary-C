################################################################################
#
# $Project: /Convert-Binary-C $
# $Author: mhx $
# $Date: 2008/04/15 14:37:37 +0100 $
# $Revision: 3 $
# $Source: /tests/240_offsetof.t $
#
################################################################################
#
# Copyright (c) 2002-2008 Marcus Holland-Moritz. All rights reserved.
# This program is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
################################################################################

use Test::More tests => 377;
use Convert::Binary::C @ARGV;

my $c = new Convert::Binary::C IntSize => 4, CharSize => 1, Alignment => 1;

eval {
$c->parse(<<'ENDC');

struct normal {
  int  a;
  char b[3];
  char c[3][3][3];
};

struct flexible {
  int  a;
  char b[];
};

ENDC
};

is($@, '', "parse C code");

my @tests = (
  [ 'normal',   'a'                    =>       0 ],

  [ 'normal',   'b'                    =>       4 ],
  [ 'normal',   'b[0]'                 =>       4 ],
  [ 'normal',   'b[1]'                 =>       5 ],
  [ 'normal',   'b[2]'                 =>       6 ],
  [ 'normal',   'b[3]'                 =>       7 ],
  [ 'normal',   'b[4]'                 =>       8 ],
  [ 'normal',   'b[+4]'                =>       8 ],
  [ 'normal',   'b[+1000000]'          => 1000004 ],
  [ 'normal',   'b[-0]'                =>       4 ],
  [ 'normal',   'b[-1]'                =>       3 ],
  [ 'normal',   'b[-2]'                =>       2 ],
  [ 'normal',   'b[-3]'                =>       1 ],
  [ 'normal',   'b[-4]'                =>       0 ],
  [ 'normal',   'b[-5]'                =>      -1 ],
  [ 'normal',   'b[-1000000]'          => -999996 ],

  [ 'normal',   'c'                    =>       7 ],
  [ 'normal',   'c[0]'                 =>       7 ],
  [ 'normal',   'c[+1]'                =>      16 ],
  [ 'normal',   'c[-1]'                =>      -2 ],
  [ 'normal',   'c[+100]'              =>     907 ],
  [ 'normal',   'c[-100]'              =>    -893 ],
  [ 'normal',   'c[0][0]'              =>       7 ],
  [ 'normal',   'c[0][+1]'             =>      10 ],
  [ 'normal',   'c[0][-1]'             =>       4 ],
  [ 'normal',   'c[0][+100]'           =>     307 ],
  [ 'normal',   'c[0][-100]'           =>    -293 ],
  [ 'normal',   'c[+1][0]'             =>      16 ],
  [ 'normal',   'c[+1][+1]'            =>      19 ],
  [ 'normal',   'c[+1][-1]'            =>      13 ],
  [ 'normal',   'c[+1][+100]'          =>     316 ],
  [ 'normal',   'c[+1][-100]'          =>    -284 ],
  [ 'normal',   'c[-1][0]'             =>      -2 ],
  [ 'normal',   'c[-1][+1]'            =>       1 ],
  [ 'normal',   'c[-1][-1]'            =>      -5 ],
  [ 'normal',   'c[-1][+100]'          =>     298 ],
  [ 'normal',   'c[-1][-100]'          =>    -302 ],
  [ 'normal',   'c[+100][0]'           =>     907 ],
  [ 'normal',   'c[+100][+1]'          =>     910 ],
  [ 'normal',   'c[+100][-1]'          =>     904 ],
  [ 'normal',   'c[+100][+100]'        =>    1207 ],
  [ 'normal',   'c[+100][-100]'        =>     607 ],
  [ 'normal',   'c[-100][0]'           =>    -893 ],
  [ 'normal',   'c[-100][+1]'          =>    -890 ],
  [ 'normal',   'c[-100][-1]'          =>    -896 ],
  [ 'normal',   'c[-100][+100]'        =>    -593 ],
  [ 'normal',   'c[-100][-100]'        =>   -1193 ],
  [ 'normal',   'c[0][0][0]'           =>       7 ],
  [ 'normal',   'c[0][0][+1]'          =>       8 ],
  [ 'normal',   'c[0][0][-1]'          =>       6 ],
  [ 'normal',   'c[0][0][+100]'        =>     107 ],
  [ 'normal',   'c[0][0][-100]'        =>     -93 ],
  [ 'normal',   'c[0][+1][0]'          =>      10 ],
  [ 'normal',   'c[0][+1][+1]'         =>      11 ],
  [ 'normal',   'c[0][+1][-1]'         =>       9 ],
  [ 'normal',   'c[0][+1][+100]'       =>     110 ],
  [ 'normal',   'c[0][+1][-100]'       =>     -90 ],
  [ 'normal',   'c[0][-1][0]'          =>       4 ],
  [ 'normal',   'c[0][-1][+1]'         =>       5 ],
  [ 'normal',   'c[0][-1][-1]'         =>       3 ],
  [ 'normal',   'c[0][-1][+100]'       =>     104 ],
  [ 'normal',   'c[0][-1][-100]'       =>     -96 ],
  [ 'normal',   'c[0][+100][0]'        =>     307 ],
  [ 'normal',   'c[0][+100][+1]'       =>     308 ],
  [ 'normal',   'c[0][+100][-1]'       =>     306 ],
  [ 'normal',   'c[0][+100][+100]'     =>     407 ],
  [ 'normal',   'c[0][+100][-100]'     =>     207 ],
  [ 'normal',   'c[0][-100][0]'        =>    -293 ],
  [ 'normal',   'c[0][-100][+1]'       =>    -292 ],
  [ 'normal',   'c[0][-100][-1]'       =>    -294 ],
  [ 'normal',   'c[0][-100][+100]'     =>    -193 ],
  [ 'normal',   'c[0][-100][-100]'     =>    -393 ],
  [ 'normal',   'c[+1][0][0]'          =>      16 ],
  [ 'normal',   'c[+1][0][+1]'         =>      17 ],
  [ 'normal',   'c[+1][0][-1]'         =>      15 ],
  [ 'normal',   'c[+1][0][+100]'       =>     116 ],
  [ 'normal',   'c[+1][0][-100]'       =>     -84 ],
  [ 'normal',   'c[+1][+1][0]'         =>      19 ],
  [ 'normal',   'c[+1][+1][+1]'        =>      20 ],
  [ 'normal',   'c[+1][+1][-1]'        =>      18 ],
  [ 'normal',   'c[+1][+1][+100]'      =>     119 ],
  [ 'normal',   'c[+1][+1][-100]'      =>     -81 ],
  [ 'normal',   'c[+1][-1][0]'         =>      13 ],
  [ 'normal',   'c[+1][-1][+1]'        =>      14 ],
  [ 'normal',   'c[+1][-1][-1]'        =>      12 ],
  [ 'normal',   'c[+1][-1][+100]'      =>     113 ],
  [ 'normal',   'c[+1][-1][-100]'      =>     -87 ],
  [ 'normal',   'c[+1][+100][0]'       =>     316 ],
  [ 'normal',   'c[+1][+100][+1]'      =>     317 ],
  [ 'normal',   'c[+1][+100][-1]'      =>     315 ],
  [ 'normal',   'c[+1][+100][+100]'    =>     416 ],
  [ 'normal',   'c[+1][+100][-100]'    =>     216 ],
  [ 'normal',   'c[+1][-100][0]'       =>    -284 ],
  [ 'normal',   'c[+1][-100][+1]'      =>    -283 ],
  [ 'normal',   'c[+1][-100][-1]'      =>    -285 ],
  [ 'normal',   'c[+1][-100][+100]'    =>    -184 ],
  [ 'normal',   'c[+1][-100][-100]'    =>    -384 ],
  [ 'normal',   'c[-1][0][0]'          =>      -2 ],
  [ 'normal',   'c[-1][0][+1]'         =>      -1 ],
  [ 'normal',   'c[-1][0][-1]'         =>      -3 ],
  [ 'normal',   'c[-1][0][+100]'       =>      98 ],
  [ 'normal',   'c[-1][0][-100]'       =>    -102 ],
  [ 'normal',   'c[-1][+1][0]'         =>       1 ],
  [ 'normal',   'c[-1][+1][+1]'        =>       2 ],
  [ 'normal',   'c[-1][+1][-1]'        =>       0 ],
  [ 'normal',   'c[-1][+1][+100]'      =>     101 ],
  [ 'normal',   'c[-1][+1][-100]'      =>     -99 ],
  [ 'normal',   'c[-1][-1][0]'         =>      -5 ],
  [ 'normal',   'c[-1][-1][+1]'        =>      -4 ],
  [ 'normal',   'c[-1][-1][-1]'        =>      -6 ],
  [ 'normal',   'c[-1][-1][+100]'      =>      95 ],
  [ 'normal',   'c[-1][-1][-100]'      =>    -105 ],
  [ 'normal',   'c[-1][+100][0]'       =>     298 ],
  [ 'normal',   'c[-1][+100][+1]'      =>     299 ],
  [ 'normal',   'c[-1][+100][-1]'      =>     297 ],
  [ 'normal',   'c[-1][+100][+100]'    =>     398 ],
  [ 'normal',   'c[-1][+100][-100]'    =>     198 ],
  [ 'normal',   'c[-1][-100][0]'       =>    -302 ],
  [ 'normal',   'c[-1][-100][+1]'      =>    -301 ],
  [ 'normal',   'c[-1][-100][-1]'      =>    -303 ],
  [ 'normal',   'c[-1][-100][+100]'    =>    -202 ],
  [ 'normal',   'c[-1][-100][-100]'    =>    -402 ],
  [ 'normal',   'c[+100][0][0]'        =>     907 ],
  [ 'normal',   'c[+100][0][+1]'       =>     908 ],
  [ 'normal',   'c[+100][0][-1]'       =>     906 ],
  [ 'normal',   'c[+100][0][+100]'     =>    1007 ],
  [ 'normal',   'c[+100][0][-100]'     =>     807 ],
  [ 'normal',   'c[+100][+1][0]'       =>     910 ],
  [ 'normal',   'c[+100][+1][+1]'      =>     911 ],
  [ 'normal',   'c[+100][+1][-1]'      =>     909 ],
  [ 'normal',   'c[+100][+1][+100]'    =>    1010 ],
  [ 'normal',   'c[+100][+1][-100]'    =>     810 ],
  [ 'normal',   'c[+100][-1][0]'       =>     904 ],
  [ 'normal',   'c[+100][-1][+1]'      =>     905 ],
  [ 'normal',   'c[+100][-1][-1]'      =>     903 ],
  [ 'normal',   'c[+100][-1][+100]'    =>    1004 ],
  [ 'normal',   'c[+100][-1][-100]'    =>     804 ],
  [ 'normal',   'c[+100][+100][0]'     =>    1207 ],
  [ 'normal',   'c[+100][+100][+1]'    =>    1208 ],
  [ 'normal',   'c[+100][+100][-1]'    =>    1206 ],
  [ 'normal',   'c[+100][+100][+100]'  =>    1307 ],
  [ 'normal',   'c[+100][+100][-100]'  =>    1107 ],
  [ 'normal',   'c[+100][-100][0]'     =>     607 ],
  [ 'normal',   'c[+100][-100][+1]'    =>     608 ],
  [ 'normal',   'c[+100][-100][-1]'    =>     606 ],
  [ 'normal',   'c[+100][-100][+100]'  =>     707 ],
  [ 'normal',   'c[+100][-100][-100]'  =>     507 ],
  [ 'normal',   'c[-100][0][0]'        =>    -893 ],
  [ 'normal',   'c[-100][0][+1]'       =>    -892 ],
  [ 'normal',   'c[-100][0][-1]'       =>    -894 ],
  [ 'normal',   'c[-100][0][+100]'     =>    -793 ],
  [ 'normal',   'c[-100][0][-100]'     =>    -993 ],
  [ 'normal',   'c[-100][+1][0]'       =>    -890 ],
  [ 'normal',   'c[-100][+1][+1]'      =>    -889 ],
  [ 'normal',   'c[-100][+1][-1]'      =>    -891 ],
  [ 'normal',   'c[-100][+1][+100]'    =>    -790 ],
  [ 'normal',   'c[-100][+1][-100]'    =>    -990 ],
  [ 'normal',   'c[-100][-1][0]'       =>    -896 ],
  [ 'normal',   'c[-100][-1][+1]'      =>    -895 ],
  [ 'normal',   'c[-100][-1][-1]'      =>    -897 ],
  [ 'normal',   'c[-100][-1][+100]'    =>    -796 ],
  [ 'normal',   'c[-100][-1][-100]'    =>    -996 ],
  [ 'normal',   'c[-100][+100][0]'     =>    -593 ],
  [ 'normal',   'c[-100][+100][+1]'    =>    -592 ],
  [ 'normal',   'c[-100][+100][-1]'    =>    -594 ],
  [ 'normal',   'c[-100][+100][+100]'  =>    -493 ],
  [ 'normal',   'c[-100][+100][-100]'  =>    -693 ],
  [ 'normal',   'c[-100][-100][0]'     =>   -1193 ],
  [ 'normal',   'c[-100][-100][+1]'    =>   -1192 ],
  [ 'normal',   'c[-100][-100][-1]'    =>   -1194 ],
  [ 'normal',   'c[-100][-100][+100]'  =>   -1093 ],
  [ 'normal',   'c[-100][-100][-100]'  =>   -1293 ],

  [ 'flexible', 'a'                    =>       0 ],

  [ 'flexible', 'b'                    =>       4 ],
  [ 'flexible', 'b[0]'                 =>       4 ],
  [ 'flexible', 'b[1]'                 =>       5 ],
  [ 'flexible', 'b[2]'                 =>       6 ],
  [ 'flexible', 'b[3]'                 =>       7 ],
  [ 'flexible', 'b[4]'                 =>       8 ],
  [ 'flexible', 'b[+4]'                =>       8 ],
  [ 'flexible', 'b[+1000000]'          => 1000004 ],
  [ 'flexible', 'b[-0]'                =>       4 ],
  [ 'flexible', 'b[-1]'                =>       3 ],
  [ 'flexible', 'b[-2]'                =>       2 ],
  [ 'flexible', 'b[-3]'                =>       1 ],
  [ 'flexible', 'b[-4]'                =>       0 ],
  [ 'flexible', 'b[-5]'                =>      -1 ],
  [ 'flexible', 'b[-1000000]'          => -999996 ],
);

for my $t (@tests) {
  my $offs = eval { $c->offsetof($t->[0], $t->[1]) };
  is($@, '', "eval { offsetof($t->[0], $t->[1]) }");
  is($offs, $t->[2], "offsetof($t->[0], $t->[1]) == $t->[2]");
}
