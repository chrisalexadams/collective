/+  *zig-sys-smart
/=  lib  /con/lib/collective
=,  lib
|_  =context
++  write
  |=  act=action:sur
  ^-  (quip call diff)
  ?:  ?=(%create -.act)
    ::  since the id we generate here is unique, this
    ::  function can only be called once -- any further
    ::  attempts will fail to issue an ID that already exists.
    ::  this is the desired behavior, since the data
    ::  generated here controls the multisig.
    ::
    ::  must have at least one member
    ?>  ?=(^ members.act)
    ::  no salt -- this contract creates a single grain. 
    ::  !!! no salt?
    =/  =id  (hash-data this.context this.context town.context 0)
    =/  =item
      :*  %&  id
          this.context
          this.context
          town.context
          0
          %collective  [members.act ~ 0]
      ==
    `(result ~ item^~ ~ ~)
  =+  (need (scry-state collective.act))
  =/  collective  (husk state:sur - `this.context ~)
  ?-    -.act
      %fund
    (result [%&^collective]^~ ~ ~ ~)
  ==
::
++  read
  |_  =path
    ++  json
      ~
    ++  noun
      ::  XX make an ++is-valid-bundle of signatures. This lets you use gasless
      ::  multisignatures. Fairly certain it is safe...
      ~
    --
--
