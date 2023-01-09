/-  sur=collective, groups, zig-wallet, indexer=zig-indexer
/+  default-agent, dbug,  smart=zig-sys-smart
/=  fund  /con/lib/fund
|%
+$  versioned-state
    $%  state-0
    ==
+$  state-0  [%0 =collectives:state:sur]
+$  card  card:agent:gall
::
:: ++  poke-contract
++  fund-contract-address
  0xb16a.8ce8.0f17.e347.adc2.d6ec.fe06.1bde.2398.7401.bf5a.1557.dcc0.6306.5655.d211
--
%-  agent:dbug
=|  state-0
=*  state  -
=<
^-  agent:gall
|_  =bowl:gall
+*  this     .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. +> bowl)

::
++  on-init
  :-
  ~&  'on-init'
  ~&  bowl.hc
  ~&  approve-origin-poke:hc
  ~[approve-origin-poke:hc]
  this(state [%0 ~])
++  on-save
  ^-  vase
  !>(state)
++  on-load
  on-load:def
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:def mark vase)
      %wallet-update
    =/  w  !<(wallet-update:zig-wallet vase)
    ?+    -.w  !!
        %finished-transaction
    =/  finished-transaction  `finished-transaction:zig-wallet`+.w
    =/  modified  ~(tap by modified.output.finished-transaction)
    =/  our-fund  (skim modified |=(a=$_(-.modified) =(%collective +>+>+>+>-.a)))
    =/  fund-id  -<.our-fund

    =/  update  (update:hc fund-id %.y)
    [-.update this(state +.update)]
    ==
      %noun
    =/  action  !<(action:sur vase)
    ?-    -.action
        %create  
      =/  new-group=create:groups
        :*
          name.action
          name.action
          'desc'
          'image link'
          'cover link'
          [%shut [(silt (turn members.action |=(x=[address:sur @p] +.x))) ~]]
          ~
          %.y
        ==
      =/  new-transaction  
        :*
          %transaction
          [~ [%collective /fund-response]]
          wallet.action
          fund-contract-address
          0x0
          [%noun [%create name.action wallet.action ship.action members.action]]
        ==
      =/  create-group-poke
        :*
        %pass  /groups  %agent  [our.bowl %groups]  %poke 
        %group-create  !>(new-group)
        ==
      =/  create-fund-poke
        :*
        %pass  /fund-response  %agent  [our.bowl %uqbar]  %poke
        %wallet-poke  !>(new-transaction)
        ==
      :_  this
      :~
          create-fund-poke
          create-group-poke
      ==
        %fund
      =/  new-transaction  
        :*
          %transaction
          [~ [%collective /fund-response]]
          wallet.action
          fund-contract-address
          0x0
          [%noun [%fund wallet.action asset-account.action asset-metadata.action amount.action]]
        ==
      =/  create-fund-poke
        :*
        %pass  /fund-response  %agent  [our.bowl %uqbar]  %poke
        %wallet-poke  !>(new-transaction)
        ==
      :_  this
      :~
          create-fund-poke
      ==
        %update
      =/  update  (update:hc fund-id.action %.n)
      [~ this(state +.update)]
    ==
  ==
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+    path  (on-watch:def path)
      [%client ~]
    :_  this
    :~  [%give %fact ~[/client] %collective-update !>(`update:sur`client+collectives)]
    ==
  ==
::
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ~&  'poke happened!'
  ~&  wire
  ~&  sign
  ~&  '-------------'
  ?+    wire  (on-agent:def wire sign)
      [%fund-response ~]
    ?.  ?=(%poke-ack -.sign)
      (on-agent:def wire sign)
    ?~  p.sign
      %-  (slog '%pokeit: poke succeeded!' ~)
      `this
    %-  (slog '%pokeit: poke failed!' ~)
    `this
  ::
  ==
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
::
|_  =bowl:gall
++  approve-origin-poke
  ^-  card
  :*  %pass  /collective-wallet-poke
      %agent  [our.bowl %uqbar]
      %poke  %wallet-poke
      !>([%approve-origin [%collective /collective] [1 1.000.000]])
  ==
++  extract-fund-id  !!
++  update
  |=  [fund-id=id:smart broadcast=?]
    =/  i-scry  /(scot %p our.bowl)/uqbar/(scot %da now.bowl)/indexer
      =/  =update:indexer
        .^  update:indexer  %gx
            %+  weld  i-scry
            ['newest' 'item' (scot %ux 0x0) (scot %ux fund-id) 'noun' ~]
        ==
      ?>  ?=(%newest-item -.update)
      ?>  ?=(%& -.item.update)
      =/  item  (husk:smart state:sur:fund item.update ~ ~)
      =/  new-collective
        :*
          name.noun.item
          creator.noun.item
          members.noun.item
          assets.noun.item
        ==
      =/  collectives  (~(put by collectives) fund-id new-collective)
      ~&  '=============='
      ~&  test
      ~&  fund-id
      ~&  new-collective
      ~&  collectives
      ~&  '=============='
      =/  client-gift  
        [%give %fact ~[/client] %collective-update !>(`update:sur`client+collectives)]
      ?:  broadcast
        =/  passes
          %+  turn  ~(tap by (~(del by members.noun.item) wallet.creator.noun.item))
          |=  member=[@ux @p @ud]
            :*
            %pass  /stuff  %agent  [+<.member %collective]  %poke
            %noun  !>(fund-id)
            ==
        :-  (welp passes ~[client-gift])
        state(collectives collectives)
      [~[client-gift] state(collectives collectives)]
--
