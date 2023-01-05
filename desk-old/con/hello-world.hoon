/+  *zig-sys-smart
/=  lib  /con/hello-world-lib
=,  lib
|_  =context
++  write
  |=  act=action
  ^-  (quip call diff)
  ?-    -.act
      %deploy
    =/  id
     (hash-data this.context this.context town.context salt.act) 
    =/  =data
     :*  id  this.context  this.context  town.context 
         salt.act                                   
         %counter 
         initial-value.act  ::  just a @ud
     ==   
    `(result ~ [%&^data]~ ~ ~)
  ::  
      %inc
    =+  (need (scry-state counter.act))
    =/  counter  (husk @ud - `this.context `this.context)
    =.  noun.counter  +(noun.counter)
    `(result [%&^counter]~ ~ ~ ~)
  ::
      %dec
    =+  (need (scry-state counter.act))
    =/  counter  (husk @ud - `this.context `this.context)
    =.  noun.counter  (dec noun.counter)
    `(result [%&^counter]~ ~ ~ ~)
  ==
++  read
  |_  =path
  ++  json
    ~
  ++  noun
    ~
  --
--