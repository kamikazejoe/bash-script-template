#!/bin/bash
# My template for creating bash scripts.

ERRORMSG=""

#Check that script was executed as root
function rootcheck
{
	if [[ $EUID -ne 0 ]]; then
		echo "This script must be run as root" 1>&2
		exit 1
	fi
}



#Checks the previous command ran successfully 
function error_quit #Pass $? as arguement
{
	exitstatus=$1 #Grab error code from previous command
	if [ $exitstatus -ne 0 ]; then #Was above command was successful?
		echo "Something went wrong.  Exiting with error code: $exitstatus"
		exit $1
	fi
}



#function incomplete
#{
#	whiptail --title "SORRY!" --msgbox "This script is a work in progress. The function you selected has not been completed yet." 8 78
#}



#Error message handling.
function error_msg
{
	case "$1" in
		quit)
			#Replace error_quit?
		;;
		
		incomplete)
			ERRORMSG="This sript is a work in progress. The function you selected has not been completed yet."
		;;
		
	esac
		
		#Display Error
		whiptail --title "ERROR!" --msgbox "$ERRORMSG" 8 78
}
