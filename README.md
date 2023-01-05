# Utilities
```shell
#####################################################
# [@manuelbv]: Add this to your shell profile to    #
#   automatically source these custom scripts       #
#####################################################
export SCRIPTS_DIR="$HOME/scripts"
CATEGORIES=( "utils" )
for c in ${CATEGORIES[@]}; do
	if [ -d "${SCRIPTS_DIR}/${c}" ]; then
		subfiles=`find ${SCRIPTS_DIR} -type f -mindepth 1 -name "[^.]*.sh"`
		for sf in ${subfiles}; do
			echo ${sf}
			source "${sf}"
		done
	fi
done 
```


### VNC utilities

#### 1. VNC loops
This utility allows you to automatically initialize a VNC session in a specific remote server and loop to it (port 37), so you can access it easily using VNC Viewer. It provides autocomplete. 
```shell
if [ -f "${SCRIPTS_DIR}/utils/vnc/vnc_loops.sh" ]; then
    . "${SCRIPTS_DIR}/utils/vnc/vnc_loops.sh"
fi 
```
