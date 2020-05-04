# scripts

I created this simple script to be able to collect information about a BGP session in Mikrotik and display it in Zabbix and Grafana, as I did not find in the Mirkotik documentation, a MIB that offers access to this information.

You can collect any field in the session by entering the field name, as it appears in a query via terminal at Mikroitk. Example of valid fields:

name
instance
remote-address
remote-as
tcp-md5-key
nexthop-choice
and etc

note: for the status of the BGP session the values returned are "
0 - donw
1 - up

I sincerely hope that this small and first contribution to the community will help someone.

Abs and good luck!
