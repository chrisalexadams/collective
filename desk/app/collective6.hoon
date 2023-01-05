/-  sur=collective6, groups, zig-wallet
/+  default-agent, dbug
|%
+$  versioned-state
    $%  state-0
    ==
+$  state-0  [%0 =collectives:state:sur]
+$  card  card:agent:gall
::
:: ++  poke-contract
++  dao-contract-address
  0xe431.1ed3.8396.fca1.fb4c.ca73.4a09.f2c5.79d6.380a.ac9a.1fcc.2d31.4ef7.22ad.be6a
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this     .
    def   ~(. (default-agent this %|) bowl)
::
++  on-init
  `this(state [%0 ~])
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
    ~&  w
    [~ this]
      %noun
    =/  action  !<(actions:sur vase)
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
          [~ [%collective6 /dao-response]]
          from.action
          dao-contract-address
          0x0
          [%noun [%create name.action (turn members.action |=(x=[@p address:sur] +.x))]]
        ==
      ~&  new-transaction
      =/  create-group-poke  
        :*
        %pass  /groups  %agent  [our.bowl %groups]  %poke 
        %group-create  !>(new-group)
        ==
      =/  create-dao-poke
        :*
        %pass  /dao-response  %agent  [our.bowl %uqbar]  %poke
        %wallet-poke  !>(new-transaction)
        ==
      =/  new-collectives  collectives
      :_  this(collectives new-collectives)
      :~
          create-dao-poke
      ==
        %fund
      [~ this]
    ==
  ==
++  on-watch  on-watch:def
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
      [%dao-response ~]
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
