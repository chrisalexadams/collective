/+  *zig-sys-smart
/=  lib  /con/lib/collective
=,  lib
|_  =context
++  write
  |=  act=action:sur
  ^-  (quip call diff)
  `(result [~ ~ ~ ~])
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
          %collective  [members.act ~]
      ==
     `(result ~ item^~ ~ ~)
  =+  (need (scry-state collective.act))
  =/  collective  (husk state:sur - `this.context ~)
    `(result [%&^collective]^~ ~ ~ ~)
      %fund
    `(result [~ ~ ~ ~)
    `(result [%&^collective]^~ ~ ~ ~)
::
++  read
  |_  =path
    ++  json
      ~
    ++  noun
      ~
    --
--
