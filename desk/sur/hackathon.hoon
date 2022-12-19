/+  *fund
=,  ethereum-types
|%
+$  id  @ud
+$  zigs  @ux
+$  member
  $:
    patp=@p
    address  :: eth address
    soul=[=id =zigs]
  ==
+$  members  (set member)
+$  assets   (set id)
+$  fund
  $:
    =id
    name=@t
    threshold=@ud
    =members
    =assets
    =zigs
  ==
+$  groupid  [ship=@p name=@tas]
+$  coaction
  $%
    [%seal =id]
    :: [%allocate zigs asset {amm contract details}]
    [%liquidate =id]
    :: [%configure =id threshold=@ud]
  ==
::  STATE
:: +$  collective  [=resource fund:contract]
+$  collective  [=groupid =fund]
+$  collectives  (set collective)
:: +$  sigs        (set sig)
:: +$  booths  ::  subscription to the ballots app
::

+$  actions
  $%
  :: client actions
    [%create invitees=(list @p)]
    :: [%mint]
    [%collective-action =coaction]
    :: [%allocate]   :: use zigs to buy NFT, ERC20, etc.
    :: [%liquidate]  :: you can only liquidate if assets is empty
    :: [%configure]  
  :: helper actions
    :: create ballot
    :: [%receive-sigs sigs =coaction]
  ==

:: +$  subsriptions
::   $%
::     [%client]
::   ==
--
