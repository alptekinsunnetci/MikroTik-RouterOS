/routing/filter/rule 

add chain="GENERIC_PREFIX_LIST" rule="if (bgp-communities includes graceful-shutdown) { set bgp-local-pref 0; }"
