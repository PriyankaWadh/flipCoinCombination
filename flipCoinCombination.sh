#! /bin/bash
declare -A coinflip
coinflip=(["Head"]=0 ["Tail"]=0)
for (( i=0; i<100; i++ ))
do
	if [ $(( RANDOM%2 )) -eq 0 ]
	then
        	    coinflip["Head"]=$(( ${coinflip[Head]}+1 ))
	else
        	    coinflip["Tail"]=$(( ${coinflip[Tail]}+1 ))
	fi
done
echo "Percent of Head : "${coinflip[Head]}
echo "Percent of Tail : "${coinflip[Tail]}
