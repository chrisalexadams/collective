/-  collective
|_  =action:collective
++  grab
  |%
  ++  noun  action:collective
  ++  json  dejs-action
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
  ~&  jon
  %.  jon
  %-  of
  :~  
    :-  %create
    %-  ot
    :~
      name+so
      [%members (ar (ot ~[ship+(se %p) address+(se %ux)]))]
    ==
    :: ~[name+so [%members (ar (ot ~[ship+(se %p) address+(se %ux)]))]]
    :: :-  %fund
    :: %-  ot
    :: ~[fund-id+(se %ux) [%members (ar (ot ~[ship+(se %p) address+(se %ux)]))]]
    :: [%fund 
    :: [%fund fund-id=id wallet=address asset-account=id asset-metadata=id amount=@ud]
  ==
--
