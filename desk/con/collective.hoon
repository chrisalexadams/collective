::/+  *zig-sys-smart
::/=  lib  /con/lib/collective
::=,  lib
::|_  =context
::++  write
::  |=  act=action:sur
::  ^-  (quip call diff)
::  `(result [~ ~ ~ ~])
::  :: ?:  ?=(%create -.act)
::    ::  since the id we generate here is unique, this
::    ::  function can only be called once -- any further
::    ::  attempts will fail to issue an ID that already exists.
::    ::  this is the desired behavior, since the data
::    ::  generated here controls the multisig.
::    ::
::    ::  must have at least one member
::    ::?>  ?=(^ members.act)
::    ::::
::    ::=/  =id  (hash-data this.context this.context town.context 0)
::    ::=/  =item
::    ::  :*  %&  id
::    ::      this.context
::    ::      this.context
::    ::      town.context
::    ::      0
::    ::      %collective  [members.act ~]
::    ::  ==
::    :: `(result ~ item^~ ~ ~)
::    :: `(result ~ ~ ~ ~)
::  :: =+  (need (scry-state collective.act))
::  :: =/  collective  (husk state:sur - `this.context ~)
::    :: `(result [%&^collective]^~ ~ ~ ~)
::      :: %fund
::    :: `(result [~ ~ ~ ~)
::    :: `(result [%&^collective]^~ ~ ~ ~)
::::
::++  read
::  |_  =path
::    ++  json
::      ~
::    ++  noun
::      ~
::    --
::--

::  soulbound nft contract
/=  lib  /lib/soulbound
|_  =context
++  write
  |=  =action:lib  ::  take in a noun shaped to the action type
  ^-  (quip call diff)
  ?-    -.action  ::  branch off the head atom of the action
      %mint
    ::  replace the address here with one of your choosing!
    ?>  =(id.caller.context 0x7a9a.97e0.ca10.8e1e.273f.0000.8dca.2b04.fc15.9f70)
    =/  =soulbound  [id.action uri.action props.action]
    =/  =id  (hash-data this.context to.action town.context id.action)
    =/  =item
      $:  %&  ::  this item is a data
          id
          source=this.context
          holder=to.action
          town=town.context
          salt=id.action  ::  use nft's collection ID as a salt
          label=%soulbound-nft
          noun=soulbound  ::  fill noun field with soulbound type we generated
      ==
    =/  event=[@tas json]  [%mint [%s (scot %ud id.action)]]
    `(result ~ [item ~] ~ [event ~])
  ::
      %burn
    =/  to-burn=item  (need (scry-state token.action))
    ?>  &(=(this.context source.p.to-burn) =(id.caller.context holder.p.to-burn))
    =/  event=[@tas json]  [%burn [%s (scot %ud token.action)]]
    `(result ~ ~ [to-burn ~] [event ~])
  ==
::
++  read
  |_  =pith
  ++  json
    ~
  ++  noun
    ~
  --
--
