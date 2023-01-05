/-  hackathon, group-store, *group, groups
/+  default-agent, dbug
=,  ethereum-types
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  [%0 =collectives:hackathon]
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
  this
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
      :: ~&  invitees.action
      =/  add-group=action:group-store
        :*
          %add-group
          [~zod %ballot-test-oldgroups]
          *open:policy
          %.n
        ==
      =/  group-name  %testgroup6
      =/  get-invitee  |=(a=@ -.a)
      =/  new-group=create:groups
        :*
          group-name
          'testgroup5'
          'desc'
          'image link'
          'cover link'
          [%shut [(silt (turn invitees.action |=(x=[@p address] -.x))) ~]]
          ~
          %.y
        ==
      =/  ballot-path  `path`[%rand (scot %p ~hapsyl-mosmed-pontus-fadpun) %groups group-name ~]

      :: =/  booth-key  (spud (oust [0 1] `(list @ta)`ballot-path))
      :: ~&  booth-key
      :: =/  booth-key  (crip `tape`(oust [0 1] `(list @)`booth-key))
      :: ~&  ballot-path
      :: ~&  bowl
      =/  context-booth
          ^-  json
          :-  %o  
          %-  malt 
          %-  limo
          :~
            ['booth' [%s %hello]]
          ==

      =/  new-booth
        :-  %o 
        %-  malt
        %-  limo
        :~
          ['action' [%s %save-booth]]
          ['data' [%s %save-booth]]
          ['context' context-booth]
        ==
      ~&  `json`new-booth

      =/  new-collectives  collectives
      :_  this(collectives new-collectives)
      :~
          [%pass /groups %agent [our.bowl %groups] %poke %group-create !>(new-group)]
          :: [%pass /balls %agent [our.bowl %ballot] %poke %json !>(new-booth)]
          :: [%pass /groups %agent [our.bowl %group-store] %poke %group-action !>(add-group)]
          :: [%pass /booths %agent [our.bowl %ballot] %watch [%booths ballot-path]]

      ==
      ::
      %collective-action
      ?-  +<.action
        %seal
        ~&  'seal'
        :: TODO create proposal in ballot
        =/  json  `json`(pairs:enjs:format ~[['action' s+'ping2']])
        :_
        this
        :~  
          [%pass /ballot %agent [our.bowl %ballot] %poke %json !>(json)]
        ==
        %liquidate
        `this
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
