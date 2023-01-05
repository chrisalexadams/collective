/-  sur=collective6, groups
/+  default-agent, dbug
|%
+$  versioned-state
    $%  state-0
    ==
+$  state-0  [%0 =collectives:state:sur]
+$  card  card:agent:gall
::
++  dao-contract-address
  0x8c34.17c1.30ec.7dcb.0fb0.d731.21a9.09fb.aecc.cee0.86d7.5b2e.d4fc.7e94.a68f.9ae9
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
          ~
          from.action
          dao-contract-address
          0x0
          [%noun [%create (turn members.action |=(x=[@p address:sur] +.x))]]
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
    ==
  ==
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
