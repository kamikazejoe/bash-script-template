#!/bin/bash
# My template for creating bash scripts.

ERRORMSG=""



#Check that script was executed as root
function rootcheck
{
	if [[ $EUID -ne 0 ]]; then
		display_message warn "This script must be run as root" 1>&2
		exit 1
	fi
}



function escalate
{
	display_message warn "Temporarily escalating privileges..."
    sudo echo "Escalating..."

}



function display_message
{
	MESSAGE_TYPE=$1
    MESSAGE=$2

    case "$MESSAGE_TYPE" in
        error)
            BORDER_CHAR="X"
        ;;

        warn)
            BORDER_CHAR="*"
        ;;

        info)
            BORDER_CHAR="-"
        ;;


	for (( i=1; i<=${#MESSAGE}; i++ ))
	do
		printf "$BORDER_CHAR"
	done
	printf "\n"

	echo $MESSAGE

	for (( i=1; i<=${#MESSAGE}; i++ ))
	do
		printf "$BORDER_CHAR"
	done
	printf "\n"
}



#Checks the previous command ran successfully 
function error_quit #Pass $? as arguement
{
	exitstatus=$1 #Grab error code from previous command
	if [ $exitstatus -ne 0 ]; then #Was above command was successful?
		display_message error "Something went wrong.  Exiting with error code: $exitstatus"
		exit $1
	fi
}



#Error message handling.
function error_msg
{
	case "$1" in
		quit)
			#Replace error_quit?
		;;
		
		incomplete)
			ERRORMSG="This sript is a work in progress. The function you selected has not been completed yet."
            #whiptail --title "SORRY!" --msgbox "$ERRORMSG" 8 78
            #dialog --title "SORRY!" ---msgbox "$ERRORMSG" 8 78
            display_message warn $ERRORMSG
		;;
		
	esac
		
		#Display Error
		#whiptail --title "ERROR!" --msgbox "$ERRORMSG" 8 78
        #dialog --title "ERROR!" --msgbox "$ERRORMSG" 8 78
        display_message error "ERROR -- $ERRORMSGE"
}
