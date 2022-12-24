/+  *fund
=,  ethereum-types
|%
+$  id  @ud
+$  zigs  @ux
+$  name  @t
+$  threshold  @ud
+$  ship  @p
+$  invitee  [=ship address]
+$  member
  $:
    =ship
    address  :: eth address
    =zigs
  ==
+$  members  (set member)
+$  assets   (set id)
+$  fund
  $:
    =id
    =name
    =threshold
    =members
    =assets
    =zigs
    status=?(%open %sealed %liquidated)
    :: actions
  ==
+$  resource  [ship=@p name=@tas]
+$  coaction
  $%
    [%seal =id]
    :: [%allocate zigs asset {amm contract details}]
    [%liquidate =id]
    :: [%configure =id threshold=@ud]
  ==
::  STATE
:: +$  collective  [=resource fund:contract]
+$  collective  [=resource =fund]
+$  collectives  (set collective)
::

+$  actions
  $%
  :: client actions
    [%create =name =threshold invitees=(list invitee)]
    :: [%mint]
    [%collective-action =coaction]
    :: [%allocate]   :: use zigs to buy NFT, ERC20, etc.
    :: [%liquidate]  :: you can only liquidate if assets is empty
    :: [%configure]  
  :: helper actions
    :: [%receive-sigs sigs =coaction]
  ==

+$  subsriptions
  $%
    [%client =collectives]
  ==
--
