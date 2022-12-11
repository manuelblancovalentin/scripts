# Utilities
```shell
#####################################################
# [@manuelbv]: Add this to your shell profile to    #
#   automatically source these custom scripts       #
#####################################################
SCRIPTS_DIR="/$HOME/scripts"
if [ -f "${SCRIPTS_DIR}/source.me" ]; then
    . "${SCRIPTS_DIR}/source.me"
fi 
```


### VNC utilities

#### 1. VNC loops
This utility allows you to automatically initialize a VNC session in a specific remote server and loop to it (port 37), so you can access it easily using VNC Viewer. It provides autocomplete. 
```shell
if [ -f "${SCRIPTS_DIR}/utils/vnc/vnc_loops.sh" ]; then
    . "${SCRIPTS_DIR}/utils/vnc/vnc_loops.sh"
fi 
```