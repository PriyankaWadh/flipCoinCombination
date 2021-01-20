#! /bin/bash
declare -A coinflip
coinflip=(["HH"]=0 ["HT"]=0 ["TH"]=0 ["TT"]=0)
for (( i=0; i<100; i++ ))
do
	res1=$(( RANDOM%2 )) 
	res2=$(( RANDOM%2 ))
	result=$(( res1+res2 ))
	if [ $result -eq 0 ]
	then
		ch=0
	elif [ $result -eq 2 ]
	then 
		ch=3
	else
		if [ $res1 -eq 0 ]
		then
			ch=1
		else
			ch=2
		fi
	fi
	case $ch in
        	  0)coinflip["HH"]=$(( ${coinflip[HH]}+1 ));;
        	  1)coinflip["HT"]=$(( ${coinflip[HT]}+1 ));;
		  2)coinflip["TH"]=$(( ${coinflip[TH]}+1 ));;
		  3)coinflip["TT"]=$(( ${coinflip[TT]}+1 ));;
	esac
done
for key in ${!coinflip[@]}
do
	echo "Percent of " $key " : "${coinflip[$key]}
done
