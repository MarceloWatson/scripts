#!/usr/bin/php
<?php
# MLWC65
# Marcelo Watson
# Abr/2020
#
# This script captures the value of a field in a BGP Mikrotik session
# The rsa key access method is used
# You will need to create the keys on your server using the ssh-keygen command and 
# then you must import the public key (id_rsa.pub) into Mikrotik
# Create the key without a password
# In Mikrotik create a user with read-only permission
# Restrict user access to accept connections from your server only
#
# You need to enter four arguments
# arg.1 = username ssh at mikrotik
# arg.2 = mikrotik ip
# arg.3 = name of the BGP session
# arg.4 = field that wants to capture the value
#
# Uncomment this line and change the path to your private key location
# $pathkey = "/home/<user>/.ssh/id_rsa";
#
$tvalues = array();
$cmd = "ssh -i ".$pathkey." ".$argv[1]."@".$argv[2]."  \"/routing bgp peer print status where name=\"".$argv[3]."\"\"";
$mkbgp_return = shell_exec($cmd);
$fields=explode(" ",$mkbgp_return);
$l = count($fields);
for($i=0;$i<$l;$i++) {
        if(strstr($fields[$i],"=")) {
                $tvalues = explode("=",$fields[$i]);
                if($argv[4] == $tvalues[0]) {
                        if($tvalues[1] == "established") {
                                $tvalues[1] = 1;
                        } else {
                                $tvalues[1] = 0;
                        }
                        echo $tvalues[1]."\n";
                }
        }
}
?>
