#! /bin/bash
if [ $(( RANDOM%2 )) -eq 0 ]
then
            echo "Singlet :Head"
else
            echo "Singlet :Tail"
fi
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
	echo "Percent of Doublet " $key " : "${coinflip[$key]}
done
declare -A coinfliptriplet
coinfliptriplet=(["HHH"]=0 ["HHT"]=0 ["HTH"]=0 ["THH"]=0 ["THT"]=0 ["HTT"]=0 ["TTH"]=0 ["TTT"]=0)
for (( i=0; i<100; i++ ))
do
        res1=$(( RANDOM%2 ))
        res2=$(( RANDOM%2 ))
	res3=$(( RANDOM%2 ))
        result=$(( res1+res2+res3 ))
        if [ $result -eq 0 ]
        then
                ch=0
        elif [ $result -eq 3 ]
        then
                ch=7
        elif [ $result -eq 2 ]
	then
                if [ $res1 -eq 1 -a $res2 -eq 1 ]
                then
                        ch=6
		elif [ $res1 -eq 1 -a $res2 -eq 0 ]
		then
			ch=4
                else
                        ch=5
                fi
	else
		if [ $res1 -eq 0 -a $res2 -eq 1 ]
                then
                        ch=2
                elif [ $res1 -eq 0 -a $res2 -eq 0 ]
                then
                        ch=1
                else
                        ch=3
                fi
        fi
        case $ch in
                  0)coinfliptriplet["HHH"]=$(( ${coinfliptriplet[HHH]}+1 ));;
                  1)coinfliptriplet["HHT"]=$(( ${coinfliptriplet[HHT]}+1 ));;
                  2)coinfliptriplet["HTH"]=$(( ${coinfliptriplet[HTH]}+1 ));;
                  3)coinfliptriplet["THH"]=$(( ${coinfliptriplet[THH]}+1 ));;
		  4)coinfliptriplet["THT"]=$(( ${coinfliptriplet[THT]}+1 ));;
		  5)coinfliptriplet["HTT"]=$(( ${coinfliptriplet[HTT]}+1 ));;
		  6)coinfliptriplet["TTH"]=$(( ${coinfliptriplet[TTH]}+1 ));;
		  7)coinfliptriplet["TTT"]=$(( ${coinfliptriplet[TTT]}+1 ));;
        esac
done
for key in ${!coinfliptriplet[@]}
do
        echo "Percent of Triplet " $key " : "${coinfliptriplet[$key]}
done
declare -A coinDictionary
declare -a valueArray
declare -a keyArray
coinDictionary[HHH]=0
coinDictionary[HHT]=0
coinDictionary[HTH]=0
coinDictionary[THH]=0
coinDictionary[HTT]=0
coinDictionary[THT]=0
coinDictionary[TTH]=0
coinDictionary[TTT]=0
coinDictionary[HH]=0
coinDictionary[HT]=0
coinDictionary[TH]=0
coinDictionary[TT]=0
coinDictionary[H]=0
coinDictionary[T]=0

for (( i=0 ; i<30 ; i++ ))
do
	ch=$((RANDOM%14))
	case $ch in
		0)
			((coinDictionary[HHH]++))
			;;
		1)
			((coinDictionary[HHT]++))
			;;
		2)
			((coinDictionary[HTH]++))
			;;
		3)
			((coinDictionary[THH]++))
			;;
		4)
			((coinDictionary[HTT]++))
			;;
		5)
			((coinDictionary[THT]++))
			;;
		6)
			((coinDictionary[TTH]++))
			;;
		7)
			((coinDictionary[TTT]++))
			;;
		8)
			((coinDictionary[HH]++))
			;;
		9)
			((coinDictionary[HT]++))
			;;
		10)
			((coinDictionary[TH]++))
			;;
		11)
			((coinDictionary[TT]++))
			;;
		12)
			((coinDictionary[H]++))
			;;
		13)
			((coinDictionary[T]++))
			;;
	esac
done
i=0
for value in `echo ${coinDictionary[@]}`
do
	valueArray[$i]=$value
	((i++))
done
i=0
for key in `echo ${!coinDictionary[@]}`
do
	keyArray[$i]=$key
	((i++))
done
max=0
maxCounter=0
for (( counter=0 ; counter<14 ; counter++ ))
do
	if [ ${valueArray[$counter]} -gt $max ]
	then
		max=${valueArray[counter]}
		maxCounter=$counter
	fi
done
echo "The winning combination is ${keyArray[$maxCounter]} and it occured ${valueArray[$maxCounter]} times."
