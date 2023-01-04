::  Tests for +by (map logic)
::
/+  *test, *merk
::
=>  ::  Utility core
    ::
    |%
    ++  bi  (^bi @ @)
    ++  map-of-doubles
      |=  l=(list @)
      ^-  (merk @ @)
      %+  gas:bi  ~
      %+  turn  l
      |=(k=@ [k (mul 2 k)])
    --
::
=>  ::  Test Data
    ::
    |%
    +|  %test-suite
    ++  m-uno  (map-of-doubles ~[42])
    ++  m-dos  (map-of-doubles ~[6 9])
    ++  m-tre  (map-of-doubles ~[1 0 1])
    ++  m-asc  (map-of-doubles ~[1 2 3 4 5 6 7])
    ++  m-des  (map-of-doubles ~[7 6 5 4 3 2 1])
    ++  m-uns  (map-of-doubles ~[1 6 3 5 7 2 4])
    ++  m-dup  (map-of-doubles ~[1 1 7 4 6 9 4])
    ++  m-nul  *(merk @ @)
    ++  m-lis  ~[m-nul m-uno m-dos m-tre m-asc m-des m-uns m-dup]
    --
::  Testing arms
::
|%
::
::  Test check correctnes (correct horizontal & vertical order)
::
++  test-map-apt  ^-  tang
  ::  manually constructed maps with predefined vertical/horizontal
  ::  ordering
  ::
  ::  for the following three keys (1, 2, 3) the vertical priorities are:
  ::    > (shag (shag 1))
  ::    0xe062.85a4...
  ::    > (shag (shag 2))
  ::    0xd1b3.01b1...
  ::    > (shag (shag 3))
  ::    0x8b4a.4159...
  ::
  ::  and the ordering 3 < 2 < 1
  ::  a correctly balanced tree stored as a min-heap
  ::  should have key=3 as the root
  ::
  ::  The horizontal priorities are:
  ::    > (shag 1)
  ::    0xd798.3546...
  ::    > (shag 2)
  ::    0x29cb.04ad...
  ::    > (shag 3)
  ::    0xea59.fdfb...
  ::
  ::  and the ordering 2 < 1 < 3.
  ::
  ::  2 should be in the left branch and 1 in the right branch of the
  ::  left.
  ::
  =/  balanced-a=(merk @ @)
    =-  [[3 (mer:bi [[3 0x0 3] - ~] 3 3) 3] - ~]
    =-  [[2 (mer:bi [[2 0x0 2] ~ -] 2 2) 2] ~ -]
    [[1 (mer:bi ~ 1 1) 1] ~ ~]
::  ::  doesn't follow vertical ordering
::  ::
::  =/  unbalanced-a=(merk @ @)  [[1 1] [[2 2] ~ ~] [[3 3] ~ ~]]
::  =/  unbalanced-b=(merk @ @)  [[1 1] ~ [[2 2] ~ ~]]
::  =/  unbalanced-c=(merk @ @)  [[1 1] [[2 2] ~ ~] ~]
::  ::  doesn't follow horizontal ordering
::  ::
::  =/  unbalanced-d=(merk @ @)  [[2 2] [[3 3] ~ ~] [[1 1] ~ ~]]
::  ::  doesn't follow horizontal & vertical ordering
::  ::
::  =/  unbalanced-e=(merk @ @)  [[1 1] [[3 3] ~ ~] [[2 2] ~ ~]]
::  ::  has duplicate keys
::  ::
::  =/  duplicates=(merk @ @)  [[1 1] [[1 2] ~ ~] ~]
  ;:  weld
    %+  expect-eq
      !>  [%b-a %.y]
      !>  [%b-a (apt:bi balanced-a)]
::    %+  expect-eq
::      !>  [%u-a %.n]
::      !>  [%u-a (apt:bi unbalanced-a)]
::    %+  expect-eq
::      !>  [%u-b %.n]
::      !>  [%u-b (apt:bi unbalanced-b)]
::    %+  expect-eq
::      !>  [%u-c %.n]
::      !>  [%u-c (apt:bi unbalanced-c)]
::    %+  expect-eq
::      !>  [%u-d %.n]
::      !>  [%u-d (apt:bi unbalanced-d)]
::    %+  expect-eq
::      !>  [%u-e %.n]
::      !>  [%u-e (apt:bi unbalanced-e)]
::    %+  expect-eq
::      !>  [%dup %.n]
::      !>  [%dup (apt:bi duplicates)]
  ==
::
::  Test delete at key b
::
++  test-map-del  ^-  tang
  ;:  weld
    ::  Checks with empty map
    ::
    %+  expect-eq
      !>  ~
      !>  (del:bi m-nul 1)
    ::  Checks deleting non-existing element
    ::
    %+  expect-eq
      !>  m-des
      !>  (del:bi m-des 99)
    ::  Checks deleting the only element
    ::
    %+  expect-eq
      !>  ~
      !>  (del:bi m-uno 42)
    ::  Checks deleting one element
    ::
    %+  expect-eq
      !>  (map-of-doubles (limo ~[6 5 4 3 2 1]))
      !>  (del:bi m-des 7)
  ==
::
::  Test concatenate
::
++  test-map-gas  ^-  tang
  ;:  weld
    ::  Checks with empty map
    ::
    %+  expect-eq
      !>  m-dos
      !>  (gas:bi m-nul ~[[6 12] [9 18]])
    ::  Checks with > 1 element
    ::
    %+  expect-eq
      !>  (map-of-doubles (limo ~[42 10]))
      !>  (gas:bi m-uno [10 20]~)
    ::  Checks appending >1 elements
    ::
    %+  expect-eq
      !>  (map-of-doubles (limo ~[6 9 3 4 5 7]))
      !>  (gas:bi m-dos ~[[3 6] [4 8] [5 10] [7 14]])
    ::  Checks concatenating existing elements
    ::
    %+  expect-eq
      !>  m-des
      !>  (gas:bi m-des ~[[3 6] [4 8] [5 10] [7 14]])
  ==
::
::  Test grab value by key
::
++  test-map-get  ^-  tang
  ;:  weld
    ::  Checks with empty map
    ::
    %+  expect-eq
      !>  ~
      !>  (get:bi m-nul 6)
    ::  Checks with non-existing key
    ::
    %+  expect-eq
      !>  ~
      !>  (get:bi m-des 9)
    ::  Checks success
    ::
    %+  expect-eq
      !>  `14
      !>  (get:bi m-des 7)
  ==
::
::  Test need value by key
::
++  test-map-got  ^-  tang
  ;:  weld
    ::  Checks with empty map
    ::
    %-  expect-fail
      |.  (got:bi m-nul 6)
    ::  Checks with non-existing key
    ::
    %-  expect-fail
      |.  (got:bi m-des 9)
    ::  Checks success
    ::
    %+  expect-eq
      !>  14
      !>  (got:bi m-des 7)
  ==
::
::  Test +has: does :b exist in :a?
::
++  test-map-has  ^-  tang
  ;:  weld
    ::  Checks with empty map
    ::
    %+  expect-eq
      !>  %.n
      !>  (has:bi m-nul 6)
    ::  Checks with non-existing key
    ::
    %+  expect-eq
      !>  %.n
      !>  (has:bi m-des 9)
    ::  Checks success
    ::
    %+  expect-eq
      !>  %.y
      !>  (has:bi m-des 7)
  ==
::
::  Test add key-value pair
::
++  test-map-put  ^-  tang
  ;:  weld
    ::  Checks with empty map
    ::
    %+  expect-eq
      !>  [[6 (mer:bi ~ 6 12) 12] ~ ~]
      !>  (put:bi m-nul 6 12)
    ::  Checks with existing key
    ::
::    %+  expect-eq
::      !>  (my ~[[6 99] [9 18]])
::      !>  (put:bi m-dos 6 99)
::    ::  Checks success (new key)
::    ::
::    %+  expect-eq
::      !>  (my ~[[42 84] [9 99]])
::      !>  (put:bi m-uno 9 99)
    ==
--
