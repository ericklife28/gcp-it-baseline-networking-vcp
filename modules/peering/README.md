## Equinix Peering ##

This infra lives in the `mcc-digital-equinix-peering` project. A vlan
attachment and network named "default" must already exist and terraform cannot
be used to managed these as the vlan attachment cannot be recreated (a secret
key is generated each time a new attachment is created and this secret has to
be pre-shared on the mcclatchy side).

For that reason, this tf code merely manages peering and dns forwarding zones
in this project.
