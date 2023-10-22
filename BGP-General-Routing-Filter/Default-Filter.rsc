/routing/filter/rule

add chain="GENERIC_PREFIX_LIST" rule="set bgp-local-pref 115;"
add chain="GENERIC_PREFIX_LIST" rule="append bgp-communities <your ASN>:<peer ASN>;"
add chain="GENERIC_PREFIX_LIST" rule="accept"
