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
  0x8e8a.2e8b.0c38.e985.9433.1f73.494f.08fd.7b6e.a413.59a9.07e6.443d.9ab4.78e5.80a4
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
    ::
    =/  update  (update:hc fund-id [[[our.bowl 'name-of-fund'] ~] %.y])
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
          [%shut [(silt (turn members.action |=(x=[@p address:sur] -.x))) ~]]
          ~
          %.y
        ==
      =/  new-transaction  
        :*
          %transaction
          [~ [%collective /fund-response]]
          from.action
          fund-contract-address
          0x0
          [%noun [%create name.action (turn members.action |=(x=[@p address:sur] +.x))]]
        ==
      =/  sign-transaction  
        :*
          %submit
          from.action
          fund-contract-address
          0x0
          [%noun [%create name.action (turn members.action |=(x=[@p address:sur] +.x))]]
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
      =/  create-fund-sign
        :*
        %pass  /fund-response  %agent  [our.bowl %uqbar]  %poke
        %wallet-poke  !>(new-transaction)
        ==
      =/  new-collectives  collectives
      :_  this(collectives new-collectives)
      :~
          create-fund-poke
      ==
        %fund
      [~ this]
        %update
      =/  update  (update:hc fund-id.action gall.action %.n)
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
  |=  [fund-id=id:smart =gall:sur broadcast=?]
    =/  i-scry  /(scot %p our.bowl)/uqbar/(scot %da now.bowl)/indexer
      =/  =update:indexer
        .^  update:indexer  %gx
            %+  weld  i-scry
            ['newest' 'item' (scot %ux 0x0) (scot %ux fund-id) 'noun' ~]
        ==
      ~&  update
      ?@  update  !!
      ?>  ?=(%newest-item -.update)
      ?>  ?=(%& -.item.update)
      ?>  ?=(@tas -.noun.p.item.update)
      =/  noun  ((soft state:sur:fund) noun.p.item.update)
      :: ?>  ?=(( members:sur) +<.noun.p.item.update)
      :: ?>  ?=(fund:sur noun.p.item.update)
      =/  name  'hello'
      =/  members  ~
      =/  assets  ~
      =/  name  -.noun.p.item.update
      :: =/  members  +<.noun.p.item.update
      :: =/  assets  +>-.noun.p.item.update
      =/  new-collective
        :*
          gall=[[~zod %hello] shipmap=~]
          u=[name=name members=members assets=assets]
        ==
      =/  collectives  (~(put by collectives) fund-id new-collective)
      ~&  '=============='
      ~&  noun
      ~&  '=============='
      ~&  noun.p.item.update
      ~&  fund-id
      ~&  new-collective
      ~&  collectives
      ~&  '=============='
      =/  client-gift  
        [%give %fact ~[/client] %collective-update !>(`update:sur`client+collectives)]
      ?:  broadcast
        =/  broadcast-pokes
        :*
        %pass  /stuff  %agent  [our.bowl %collective]  %poke
        %noun  !>([fund-id gall])
        ==
        [~[client-gift] state(collectives collectives)]
      [~[client-gift] state(collectives collectives)]
--
