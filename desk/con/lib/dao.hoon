/+  *zig-sys-smart
|%
++  sur
  |%
  +$  asset
  $:  contract=id
      metadata=id
      amount=@ud
      account=id
  ==
  +$  member  [address shares=@ud]
  ::
  +$  state
    $:  members=(pset member)
        assets=(pset asset)
    ==
  ::
  +$  action
    $%  ::  Current actions
        [%create members=(pset address)]
        [%fund collective=id =address zigs=@ud]
        ::
        :: Implemented later as a complete multisig
        :: [%execute fund=id sigs=(pmap id sig) calls=(list call) deadline=@ud]
        :: [%vote fund=id proposal-hash=@ux aye=?]
        :: [%propose fund=id calls=(list call)]
        :: [%add-member fund=id =address]
        :: [%remove-member fund=id =address]
        :: [%set-threshold fund=id new=@ud]
    ==
  --
