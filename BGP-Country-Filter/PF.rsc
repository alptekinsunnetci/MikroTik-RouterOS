
#    # ###### #####  ####  #####   ####  
##   # #        #   #    # #    # #      
# #  # #####    #   #    # #    #  ####  
#  # # #        #   #    # #####       # 
#   ## #        #   #    # #      #    # 
#    # ######   #    ####  #       ####  

#
# www.netops.com.tr
# github.com/alptekinsunnetci/MikroTik-RouterOS
#

# generation date: 21-10-2023

/routing/filter/num-list/
add list=PF range=55943 comment="ONATI-AS-AP ONATI"
add list=PF range=56017 comment="VITI-AS-PF VITI"
add list=PF range=133896 comment="TAHITINUITELECOM-AS-AP Tahiti Nui Telecom"
add list=PF range=138179 comment="PMT-AS-AP PACIFIC MOBILE TELECOM"
add list=PF range=139263 comment="UDLPF-AS-AP Universite de la Polynesie Francaise"
