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
+$  member   [=ship =address =shares]
+$  members  (set member)
+$  assets   (set asset)
+$  fund
  $:
    =id
    =name
    =members
    =assets
  ==
+$  collective  [=resource =fund]
+$  collectives  (set collective)
::
+$  state  collectives
::
+$  actions
  $%
  :: client actions
    [%create =name from=address members=(list [=ship =address])]
  ==

+$  subsriptions
  $%
    [%client =collectives]
  ==
--
