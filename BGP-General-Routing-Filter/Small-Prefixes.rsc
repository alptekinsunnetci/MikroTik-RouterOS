/routing/filter/rule

add chain="GENERIC_PREFIX_LIST" rule="if (afi ipv4 && dst-len > 24){ reject }"
add chain="GENERIC_PREFIX_LIST" rule="if (afi ipv4 && dst-len < 7){ reject }" 
add chain="GENERIC_PREFIX_LIST" rule="if (afi ipv6 && dst-len > 48){ reject }"
add chain="GENERIC_PREFIX_LIST" rule="if (afi ipv6 && dst-len < 15){ reject }"
