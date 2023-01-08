/-  todo
|_  =action:todo
++  grab
  |%
  ++  noun  action:todo
  ++  json  'hello'
  --
++  grow
  |%
  ++  noun  action
  --
++  grad  %noun
++  dejs-action
  =,  dejs:format
  |=  jon=json
  ^-  action
  %.  jon
  %-  of
  :~  [%create (ot ~[id+ni txt+so])]
  ==
--
