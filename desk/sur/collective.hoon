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
==
+$  member   [ship shares]
+$  members  (map address member)
+$  assets   (map account=id asset)
+$  collective
  $:
    =name
    creator=[wallet=address =ship]
    =members
    =assets
  ==

+$  collectives  (map fund-id=id collective)
::
+$  state  collectives
::
+$  action
  $%
  :: client actions
    :: [%create =name wallet=address =ship members=(list [=address =ship])]
    :: [%fund fund-id=id wallet=address asset-account=id asset-metadata=id amount=@ud]
    ::
    :: [%update fund-id=@t]
    [%update fund-id=id]
  ==

+$  update
  $%
    [%client =collectives]
  ==
--
