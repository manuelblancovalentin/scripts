#!/bin/bash
vnc_loops () {
	POSITIONAL=()
	if [ $# -eq 0 ]; then
		POSITIONAL=( "aws" "beast1" "picard" "correlator" )
	else
		POSITIONAL=( $@ )
	fi

	# Loop thru input args
	for arg in ${POSITIONAL[@]}; do
		case "$arg" in
			beast1|beast)
				# fasic_beast1 
				printf "\e[1;31m[INFO]\e[0;33m - Now connecting to \e[1;35mbeast1\e[0m\n"
				ssh -K fasic-beast1.fnal.gov 'vncserver :37 -localhost -depth 24 -geometry 1280x800 &> vncserver@37.log'
				ssh -K fasic-beast1.fnal.gov 'cat vncserver@37.log'
				ssh -o ExitOnForwardFailure=yes -f -C -N -q -K -L 5900:localhost:5937 beast1 
				;;
			correlator|corr3)
				# correlator3 
				printf "\e[1;31m[INFO]\e[0;33m - Now connecting to \e[1;35mcorrelator3\e[0m\n"
				ssh -K correlator3 'vncserver :37 -depth 24 -geometry 1280x800 &> vncserver@37.log'
				ssh -K correlator3 'cat vncserver@37.log'
				ssh -o ExitOnForwardFailure=yes -f -C -N -q -l -L 5904:localhost:5937 manuelbv correlator3
				;;
			aws)
				# Aws 
				printf "\e[1;31m[INFO]\e[0;33m - Now connecting to \e[1;35maws\e[0m\n"
				ssh aws 'vncserver :37 -localhost -depth 24 -geometry 1280x800 &> vncserver@37.log'
				ssh aws 'cat vncserver@37.log'
				ssh -o ExitOnForwardFailure=yes -f -C -N -q -L 5902:localhost:5937 aws
				;;
			picard)
				# Picard
				printf "\e[1;31m[INFO]\e[0;33m - Now connecting to \e[1;35mpicard\e[0m\n"
				ssh picard 'vncserver :37 -localhost -depth 24 -geometry 1280x800 &> vncserver@37.log'
				ssh picard 'cat vncserver@37.log'
				ssh -o ExitOnForwardFailure=yes -f -C -N -q -L 5903:localhost:5903 picard
				;;
			*)
				printf "\e[1;32m[ERROR]\e[0;33m - Invalid argument $arg. Valid ones are: aws, correlator, corr3, picard, beast1, beast\e[0m\n"
				;;
		esac
	done
}


# Autocomplete
_vnc_loops () {
	COMPREPLY=()
	local cur=${COMP_WORDS[COMP_CWORD]}
	local prev=${COMP_WORDS[COMP_CWORD-1]}

	case "$prev" in
	"vnc_loops")
		COMPREPLY=( $( compgen -W "beast1 correlator aws picard" -- $cur ) )
			return 0
		;;
		*)
		COMPREPLY=($(compgen -W "--help" -- $cur ) )
		return 0
		;;
	esac

}
complete -F _vnc_loops vnc_loops
