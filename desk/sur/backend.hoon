/=  /lib/fund
=,  fund
|%
+$  act-type
  $%
    [%invite]
    [%seal]
    [%allocate]
    [%liquidate]
    [%configure]
  ==
::  STATE
+$  egregores   (set [group-id fund])
+$  sigs        (set sig)
+$  booths  ::  subscription to the ballots app
::
+$  actions
  $%
  :: client actions
    [%create]
    [%invite]
    [%accept =id]     :: accept invitation
    [%mint]
    [%seal]
    [%allocate]   :: use zigs to buy NFT, ERC20, etc.
    [%liquidate]  :: you can only liquidate if assets is empty
    [%configure]  
  :: helper actions
    :: create ballot
    [%send-invitation]  :: send invitation to invitee
    [%collect-sigs =act-type]
    [%send-sig =sig]
  ==
+$  subsriptions
  $%
    [%client]
  ==
