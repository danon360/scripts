#!/bin/bash
exec >> /home/x/Desktop/test.txt;
exec 2>&1;
set -x;

REPEAT=true;
#loop keeps repeating until mac address is changed
while [$REPEAT=true]
do
	#replace x with username
	ANSWER=$(sudo sudo -u x DISPLAY=:0.0 zenity --entry --title="MacChanger" --text="MacChanger is about to change your mac address. Type in y to continue, no to cancel, or a number (in seconds to be asked 		later )")
	case "$ANSWER" in
		"y"|"Y"|"yes")
			ifconfig wlp3s0 down;
			macchanger -r wlp3s0 
			ifconfig wlp3s0 up;
			dhclient -r >> /home/x/Desktop/test.txt;
			dhclient >> /home/x/Desktop/test.txt;
			REPEAT=false;;
		"n"|"N")
			notify-send "delaying macCHange process for 10m"
			sleep 10m;;
		*[0-9]*)
			
			notify-send "sleeping for $($ANSWER)";
			sleep $ANSWER;;
		*)
			notify-send "err";;
esac
done
echo "--------------------------------------------" >> /home/x/Desktop/test.txt;
