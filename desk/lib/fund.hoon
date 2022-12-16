|%
+$  id  @ud
+$  zigs  @ux
+$  member
  $:
    patp=@p
    address  :: eth address
    soul=[tokenid=id =zigs]
  ==
+$  members  (pset member)
+$  assets   (pset id)
+$  fund
  $:
    =id
    name=@t
    threshold=@ud
    =members
    =assets
    =zigs
  ==
--
