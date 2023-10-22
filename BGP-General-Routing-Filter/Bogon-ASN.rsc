/routing/filter/num-list 

add list=BOGON-AS range=0 comment="RFC 7607"
add list=BOGON-AS range=23456 comment="RFC 4893 AS_TRANS"
add list=BOGON-AS range=64496-64511 comment="RFC 5398"
add list=BOGON-AS range=64512-65534 comment="RFC 6996"
add list=BOGON-AS range=65535 comment="RFC 7300"
add list=BOGON-AS range=65536-65551 comment="RFC 5398"
add list=BOGON-AS range=65552-131071 comment="Reserved"
add list=BOGON-AS range=4200000000-4294967294 comment="RFC 6996"
add list=BOGON-AS range=4294967294 comment="RFC 7300"

/routing/filter/rule 
add chain="GENERIC_PREFIX_LIST" rule="if (bgp-as-path [[:BOGON-AS:]]){ reject }"
