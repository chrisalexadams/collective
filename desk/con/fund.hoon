/+  *zig-sys-smart
/=  lib  /con/lib/fund
=,  lib
|_  =context
++  write
  |=  act=action:sur
  ^-  (quip call diff)
  ?:  ?=(%create -.act)
    ?>  ?=(^ members.act)
    ::
    =/  salt  (crip (weld ~(rux at id.caller.context) (trip name.act)))
    =/  =id  (hash-data this.context this.context town.context salt)
    =/  =item
      :*  %&  id
          this.context
          this.context
          town.context
          salt
          %collective  [name.act members.act ~]
      ==
    `(result ~ item^~ ~ ~)
  ::
  =+  (need (scry-state collective.act))
  =/  collective  (husk state:sur - `this.context ~)
  ?-    -.act
      %fund
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
