/+  *zig-sys-smart
/=  lib  /con/lib/collective6
=,  lib
|_  =context
++  write
  |=  act=action:sur
  ^-  (quip call diff)
  ?:  ?=(%create -.act)
    ?>  ?=(^ members.act)
    ::
    =/  =id  (hash-data this.context this.context town.context 0)
    =/  =item
      :*  %&  id
          this.context
          this.context
          town.context
          0
          %collective  [name.act members.act ~]
      ==
    `(result ~ item^~ ~ ~)
  ::
  =+  (need (scry-state collective.act))
  =/  collective  (husk state:sur - `this.context ~)
  ?-    -.act
      %fund2
    :: `(result [%&^collective]^~ ~ ~ ~)
    `(result ~ ~ ~ ~)
  ==
++  read
  |_  =path
  ++  json
    ~
  ++  noun
    ~
  --
--
