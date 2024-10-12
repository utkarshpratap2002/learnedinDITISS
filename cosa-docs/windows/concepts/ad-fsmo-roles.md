# Active Directory and FSMO Roles

FSMO (Fixed Single Master Operation) is a way to make sure that there is only one Master which holds the responsibility of updating and making changes to the Schema. If the Schema is changed, there should be only one within the single-master modal. There are basically five roles.

1. Schema Master 
2. Domain-naming Master
3. RID Master
4. PDC (Primary Domain Controller) Master
5. Infrastructure Master

# Schema Master Role

Schema Master is responsible for making updates on all the domains, it solely updates the domains schema or say LDAP. Once the Update is complete, it replicates it to all the other domain controller within the forest. Remember there can be only one Schema Master per forest.

# Domain naming Master Role

