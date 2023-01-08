=,  ethereum-types
|%
+$  id  @ux
+$  name  @t
+$  ship  @p
+$  shares  @ud
+$  address  @ux
+$  resource  [ship=@p name=@tas]
+$  asset
$:  contract=id
    metadata=id
    amount=@ud
    account=id
==
+$  member   [=address =shares]
+$  members  (set member)
+$  assets   (set asset)
+$  fund
  $:
    =name
    =members
    =assets
  ==
+$  gall  [=resource shipmap=(map ship address)]
+$  uqbar  fund

+$  collective  [=gall =uqbar]
+$  collectives  (map fund-id=id collective)
::
+$  state  collectives
::
+$  action
  $%
  :: client actions
    [%create =name from=address members=(list [=ship =address])]
    [%fund fund-id=id funder=id from-account=id asset-metadata=id amount=@ud]
    ::
    [%update fund-id=id =gall]
  ==

+$  update
  $%
    [%client =collectives]
  ==
--
