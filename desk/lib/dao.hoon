/-  d=dao,
    r=resource
/+  agentio,
    rl=resource,
    smart=zig-sys-smart
::
|_  =bowl:gall
+*  io  ~(. agentio bowl)
::
++  get-members-and-permissions
  |=  =dao-identifier:d
  ^-  (unit [=members:d =permissions:d])
  ?~  dao=(get-dao dao-identifier)  ~
  `[members.u.dao permissions.u.dao]
::
++  get-id-to-ship
  |=  =dao-identifier:d
  ^-  (unit id-to-ship:d)
  ?~  dao=(get-dao dao-identifier)  ~
  `id-to-ship.u.dao
::
++  get-ship-to-id
  |=  =dao-identifier:d
  ^-  (unit ship-to-id:d)
  ?~  dao=(get-dao dao-identifier)  ~
  `ship-to-id.u.dao
::
++  member-to-id
  |=  [=member:d =dao-identifier:d]
  ^-  (unit id:smart)
  ?:  ?=(%& -.member)  `p.member
  ?~  dao=(get-dao dao-identifier)  ~
  (~(get by ship-to-id.u.dao) p.member)
::
++  member-to-ship
  |=  [=member:d =dao-identifier:d]
  ^-  (unit ship)
  ?:  ?=(%| -.member)  `p.member
  ?~  dao=(get-dao dao-identifier)  ~
  (~(get by id-to-ship.u.dao) p.member)
::
++  get-dao
  |=  =dao-identifier:d
  ^-  (unit dao:d)
  ?:  ?=(%& -.dao-identifier)  `p.dao-identifier
  =/  scry-path=path
    ?:  ?=(id:smart p.dao-identifier)
      /daos/(scot %ux p.dao-identifier)/noun
    :(weld /daos (en-path:rl p.dao-identifier) /noun)
  .^  (unit dao:d)
      %gx
      %+  scry:io  %dao
      scry-path
  ==
::
++  is-allowed
  |=  $:  =member:d
          =address:d
          permission-name=@tas
          =dao-identifier:d
      ==
  ^-  ?
  ?~  dao=(get-dao dao-identifier)                                %.n
  ?~  permissioned=(~(get by permissions.u.dao) permission-name)  %.n
  ?~  roles-with-access=(~(get ju u.permissioned) address)        %.n
  ?~  user-id=(member-to-id member [%& u.dao])                    %.n
  ?~  ship-roles=(~(get ju members.u.dao) u.user-id)              %.n
  ?!  .=  0
  %~  wyt  in
  %-  ~(int in `(set role:d)`ship-roles)
  `(set role:d)`roles-with-access
::
++  is-allowed-admin-write-read
  |=  $:  =member:d
          =address:d
          =dao-identifier:d
      ==
  ^-  [? ? ?]
  ?~  dao=(get-dao dao-identifier)  [%.n %.n %.n]
  :+  (is-allowed member address %admin [%& u.dao])
    (is-allowed member address %write [%& u.dao])
  (is-allowed member address %read [%& u.dao])
::
++  is-allowed-write
  |=  $:  =member:d
          =address:d
          =dao-identifier:d
      ==
  ^-  ?
  (is-allowed member address %write dao-identifier)
::
++  is-allowed-read
  |=  $:  =member:d
          =address:d
          =dao-identifier:d
      ==
  ^-  ?
  (is-allowed member address %read dao-identifier)
::
++  is-allowed-admin
  |=  $:  =member:d
          =address:d
          =dao-identifier:d
      ==
  ^-  ?
  (is-allowed member address %admin dao-identifier)
::
++  is-allowed-host
  |=  $:  =member:d
          =address:d
          =dao-identifier:d
      ==
  ^-  ?
  (is-allowed member address %host dao-identifier)
::
++  update
  |_  =dao:d
  ::
  ++  add-member
    |=  [roles=(set role:d) =id:smart him=ship]
    ^-  dao:d
    =/  existing-ship=(unit ship)
      (~(get by id-to-ship.dao) id)
    ?:  ?=(^ existing-ship)
      ?:  =(him u.existing-ship)  dao
      ~|  "%dao: cannot add member whose id corresponds to a different ship"
      !!
    =/  existing-id=(unit id:smart)
      (~(get by ship-to-id.dao) him)
    ?:  ?=(^ existing-id)
      ?:  =(id u.existing-id)  dao
      ~|  "%dao: cannot add member whose ship corresponds to a different id"
      !!
    ::
    %=  dao
      id-to-ship  (~(put by id-to-ship.dao) id him)
      ship-to-id  (~(put by ship-to-id.dao) him id)
      members
        %-  ~(gas ju members.dao)
        (make-noun-role-pairs id roles)
    ==
  ::
  ++  remove-member
    |=  [=id:smart]
    ^-  dao:d
    ?~  him=(~(get by id-to-ship.dao) id)
      ~|  "%dao: cannot find given member to remove in id-to-ship"
      !!
    ?~  existing-id=(~(get by ship-to-id.dao) u.him)
      ~|  "%dao: cannot find given member to remove in ship-to-id"
      !!
    ~|  "%dao: given id does not match records"
    ?>  =(id u.existing-id)
    ?~  roles=(~(get ju members.dao) id)  !!
    %=  dao
      id-to-ship  (~(del by id-to-ship.dao) id)
      ship-to-id  (~(del by ship-to-id.dao) u.him)
      members
        (remove-roles-helper members.dao roles id)
    ==
  ::
  ++  add-permissions
    |=  [name=@tas =address:d roles=(set role:d)]
    ^-  dao:d
    %=  dao
      permissions
        %:  add-permissions-helper
            name
            permissions.dao
            roles
            address
    ==  ==
  ::
  ++  remove-permissions
    |=  [name=@tas =address:d roles=(set role:d)]
    ^-  dao:d
        %=  dao
          permissions
            %:  remove-permissions-helper
                name
                permissions.dao
                roles
                address
        ==  ==
  ::
  ++  add-subdao
    |=  subdao-id=id:smart
    ^-  dao:d
    dao(subdaos (~(put in subdaos.dao) subdao-id))
  ::
  ++  remove-subdao
    |=  subdao-id=id:smart
    ^-  dao:d
    dao(subdaos (~(del in subdaos.dao) subdao-id))
  ::
  ++  add-roles
    |=  [roles=(set role:d) =id:smart]
    ^-  dao:d
    ?~  (~(get ju members.dao) id)
      ~|  "%dao: cannot find given member to add roles to"
      !!
    %=  dao
      members
        %-  ~(gas ju members.dao)
        (make-noun-role-pairs id roles)
    ==
  ::
  ++  remove-roles
    |=  [roles=(set role:d) =id:smart]
    ^-  dao:d
    ?~  (~(get ju members.dao) id)
      ~|  "%dao: cannot find given member to remove roles from"
      !!
    dao(members (remove-roles-helper members.dao roles id))
  ::
  ++  add-permissions-helper
    |=  [name=@tas =permissions:d roles=(set role:d) =address:d]
    ^-  permissions:d
    =/  permission=(unit (jug address:d role:d))
      (~(get by permissions) name)
    =/  pairs=(list (pair address:d role:d))
      (make-noun-role-pairs address roles)
    %+  %~  put  by  permissions
      name
    %-  %~  gas  ju
      ?~  permission
        *(jug address:d role:d)
      u.permission
    pairs
  ::
  ++  remove-permissions-helper
    |=  [name=@tas =permissions:d roles=(set role:d) =address:d]
    ^-  permissions:d
    ?~  permission=(~(get by permissions) name)  permissions
    =/  pairs=(list (pair address:d role:d))
      (make-noun-role-pairs address roles)
    |-
    ?~  pairs  (~(put by permissions) name u.permission)
    =.  u.permission  (~(del ju u.permission) i.pairs)
    $(pairs t.pairs)
  ::
  ++  remove-roles-helper
    |=  [=members:d roles=(set role:d) =id:smart]
    ^-  members:d
    =/  pairs=(list (pair id:smart role:d))
      (make-noun-role-pairs id roles)
    |-
    ?~  pairs  members
    =.  members  (~(del ju members) i.pairs)
    $(pairs t.pairs)
  ::
  ++  make-noun-role-pairs
    |*  [noun=* roles=(set role:d)]
    ^-  (list (pair _noun role:d))
    ::  cast in tap to avoid crash if passed `~`
    %+  turn  ~(tap in `(set role:d)`roles)
    |=  =role:d
    [p=noun q=role]
  ::
  --
--
