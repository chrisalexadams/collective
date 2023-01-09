/-  col=collective
|_  =update:col
++  grab
  |%
  ++  noun  update:col
  --
++  grow
  |%
  ++  noun  update
  ++  json  
      :-  %a  
      %+  turn  ~(tap by collectives:update)
      |=  [fund-id=id:col =collective:col]
      %-  pairs:enjs:format
      :~
        ['fundID' %s (scot %ux fund-id)]
        ['creator' (pairs:enjs:format ~[['address' %s (scot %ux wallet.creator.collective)] ['ship' %s (scot %p ship.creator.collective)]])]
        ['name' %s name.collective]
        :*
          'members'
          %a
          %+  turn  ~(tap by members.collective)
          |=  [address=@ux ship=@p shares=@ud]
          %-  pairs:enjs:format
          :~
            ['address' %s (scot %ux address)]
            ['ship' %s (scot %p ship)]
            ['shares' %s (scot %ud shares)]
          ==
        ==
        ['assets' %a ~]
      ==
  --
++  grad  %noun
--
