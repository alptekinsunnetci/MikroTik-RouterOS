/routing/filter/num-list

add list="TRANSIT_ASNS" range=174 comment="Cogent" 
add list="TRANSIT_ASNS" range=701 comment="UUNET" 
add list="TRANSIT_ASNS" range=1299 comment="Telia" 
add list="TRANSIT_ASNS" range=2914 comment="NTT Ltd." 
add list="TRANSIT_ASNS" range=3257 comment="GTT Backbone" 
add list="TRANSIT_ASNS" range=3320 comment="Deutsche Telekom AG (DTAG)" 
add list="TRANSIT_ASNS" range=3356 comment="Level3" 
add list="TRANSIT_ASNS" range=3491 comment="PCCW" 
add list="TRANSIT_ASNS" range=4134 comment="Chinanet" 
add list="TRANSIT_ASNS" range=5511 comment="Orange opentransit" 
add list="TRANSIT_ASNS" range=6453 comment="Tata Communications" 
add list="TRANSIT_ASNS" range=6461 comment="Zayo Bandwidth" 
add list="TRANSIT_ASNS" range=6762 comment="Seabone / Telecom Italia" 
add list="TRANSIT_ASNS" range=6830 comment="Liberty Global"
add list="TRANSIT_ASNS" range=7018 comment="AT&T"  

/routing/filter/rule 

add chain="NO-TRANSIT-IN" rule="if (bgp-as-path [[:TRANSIT_ASNS:]]){ reject }"
