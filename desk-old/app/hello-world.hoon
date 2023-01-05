+  default-agent, dbug
|%
+$  versioned-state
    $%  state-0
    ==
+$  state-0  [%0 ~]
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this     .
    default   ~(. (default-agent this %|) bowl)
::
++  on-init
  `this(state [%0 ~])
++  on-save
  ^-  vase
  !>(state)
++  on-load
  on-load:default
++  on-poke  on-poke:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-peek   on-peek:default
++  on-agent  on-agent:default
++  on-arvo   on-arvo:default
++  on-fail   on-fail:default
--