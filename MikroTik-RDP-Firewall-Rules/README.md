# MikroTik RDP Firewall Rules

This repository contains a recommended firewall rule set for MikroTik routers. These rules help mitigate RDP (Remote Desktop Protocol) attacks.

## Rule Set

```
/ip firewall filter

add chain=forward protocol=tcp dst-port=3389 src-address-list=rdp_blacklist action=drop \
comment="drop rdp brute forcers" disabled=no

add chain=forward protocol=tcp dst-port=3389 connection-state=new \
src-address-list=rdp_stage3 action=add-src-to-address-list address-list=rdp_blacklist \
address-list-timeout=10d comment="" disabled=no

add chain=forward protocol=tcp dst-port=3389 connection-state=new \
src-address-list=rdp_stage2 action=add-src-to-address-list address-list=rdp_stage3 \
address-list-timeout=1m comment="" disabled=no

add chain=forward protocol=tcp dst-port=3389 connection-state=new src-address-list=rdp_stage1 \
action=add-src-to-address-list address-list=rdp_stage2 address-list-timeout=1m comment="" disabled=no

add chain=forward protocol=tcp dst-port=3389 connection-state=new action=add-src-to-address-list \
address-list=rdp_stage1 address-list-timeout=1m comment="" disabled=no
```


## Rule Set Details

This firewall rule set includes the following key components:

- Blocks RDP (Remote Desktop Protocol) brute force attacks.
- Thwarts attackers in a three-stage process: rdp_stage1, rdp_stage2, and rdp_stage3.
- Automatically cleans rule lists at specified intervals.

## Usage

To use this rule set, follow these steps:

1. Log in to the MikroTik management interface.

2. Navigate to the Firewall menu.

3. Under "Filter Rules," add these rules to your existing configuration.

4. Save and apply the changes.

## Rule Set Explanations

- `rdp_blacklist`: This rule blocks IP addresses targeted in RDP brute force attacks.

- `rdp_stage3`: This rule adds an IP address to the `rdp_stage3` address list when a new connection attempt (connection-state=new) is made.

- `rdp_stage2`: This rule adds IP addresses from the `rdp_stage3` list to the `rdp_stage2` list.

- `rdp_stage1`: This rule adds IP addresses from the `rdp_stage2` list to the `rdp_stage1` list.


---

This rule set can help secure your MikroTik router against RDP attacks. Please review the rule set carefully and make necessary adjustments according to your needs.

**Note**: Before using the rule set, ensure that it aligns with your existing configuration and security policies.

https://alptekin.sunnetci.net/mikrotik-icin-rdp-korumasi/
