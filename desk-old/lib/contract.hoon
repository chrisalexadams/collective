/=  /lib/fund
|%
::  
+$  actions
  $:
    [%deploy addresses=(pset address)]
    :: creates a soulbound token for the address if the address is part
    :: of the fund
    [%mint address zigs]
    [%seal sigs]
    :: how should this part work? can a fund instance own another asset?
    [%allocate sigs]  
    [%liquidate sigs]
    :: configuring name, threshold and max member, the owner/contract
    :: deployer can change the settings, do we need this anyway?
    [%configure sigs]

    :: should everyone send their signature separately? or one should
    :: collect all the signatures and send them to one of the above
    :: arms? how to even create these signatures?
==
