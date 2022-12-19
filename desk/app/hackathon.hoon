/-  hackathon, group-store, *group
/+  default-agent, dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  [%0 val=@ud =collectives:hackathon]
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
::
++  on-init
:: send poke to ballot to subscribe to it
  ^-  (quip card _this)
  ~&  'on-init'
  :_  
  this(val 42)
  ~
  :: :~  
  ::   [%pass /booths %agent [our.bowl %ballot] %watch [%booths ~]]
  :: ==
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  =/  old  !<(versioned-state old-state)
  ?-  -.old
    %0  `this(state old)
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:def mark vase)
      %noun
    =/  action  !<(actions:hackathon vase)
    ?-    -.action
      %create  
      ~&  invitees.action
      =/  add-group=action:group-store
        :*
          %add-group
          [~zod %testgroup]
          *open:policy
          %.n
        ==
      ~&  add-group
      =/  new-collectives  collectives
      :_  this(collectives new-collectives)
      :~
          :: TODO create group and invite the invitees
          [%pass /groups %agent [our.bowl %group-store] %poke %group-action !>(add-group)]
          :: Subscribe to the newly created group's ballot
          [%pass /booths %agent [our.bowl %ballot] %watch [%booths ~]]
      ==
      ::
      %collective-action
      ?-  +<.action
        %seal
        ~&  'seal'
        :: TODO create proposal in ballot
        =/  json  `json`(pairs:enjs:format ~[['action' s+'ping2']])
        :_
        this(val +(val))
        :~  
          [%pass /ballot %agent [our.bowl %ballot] %poke %json !>(json)]
        ==
        %liquidate
        `this(val +(val))
        :: %configure
        :: `this(val +(val))
      ==
    ::
    ==
  ==
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+    wire  (on-agent:def wire sign)
      [%booths ~]
    ?+    -.sign  (on-agent:def wire sign)
        %watch-ack
      ?~  p.sign
        ((slog '%ballot: Subscribe succeeded!' ~) `this)
      ((slog '%ballot: Subscribe failed!' ~) `this)
    ::
        %kick
      %-  (slog '%ballot: Got kick, resubscribing...' ~)
      :_  this
      :~  
        [%pass /booths %agent [our.bowl %ballot] %watch [%booths ~]]
      ==
    ::
        %fact
        ~&  'fact-noun happened!'
        `this
      :: ?+    p.cage.sign  (on-agent:def wire sign)
      ::     %noun
      ::   ~&  'fact-noun happened!'
      ::   :: ~&  !<(* q.cage.sign)

      ::   `this
      :: ==
    ==
  ==
::::
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
