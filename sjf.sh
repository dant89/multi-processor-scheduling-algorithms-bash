#!/bin/bash

function demosjf {

	clear;
	
	echo -e "Shortest Job First (SJF) Tutorial\n";
	echo "How many processes would you like to use?";
	
	declare -a arrsj
	let counter=0
	let keycount=1
	
	#Function to sort the numbers numerically
	function numsort { for i in ${arrsj[@]}; do echo $i; done | sort -n; }

	read processes

	#A key is given to each process after the burst and a hash so each array item is in the following format 4-1 3-2
	#the array can then be sorted numerically on the burst values whilst key numbers are easily accesible
	
	while [ $counter -lt $processes ]
	do
		echo "Please enter burst time "$(($counter + 1))": "
		read bursttime
		arrsj=( "${arrsj[@]}" "$bursttime-$keycount" )
	
		let counter=$counter+1
		let keycount=$keycount+1
	done
	
	#Sort Array
	arrsj=( $(numsort) )
	
	#Reset/Declare Counters
	counter=0
	let prepro=0
	let preproCount=0
	
	clear
	echo -e "Shortest Job First (SJF) Demonstration\n"
	echo -e "Press enter to view step by step..\n"
	
	# Display Burst Graph
	while [ $counter -lt ${#arrsj[@]} ]
	do

		key=$(echo ${arrsj[$counter]} | awk -F"-" '{print $2}')
		burstCount=$(echo ${arrsj[$counter]} | awk -F"-" '{print $1}')	

		echo -ne "P$key       "
		
		while [ $preproCount -gt 0 ]
		do
			echo -ne " "
			let preproCount=$preproCount-1
		done
		
		echo -ne "|"
		
		let prepro=$prepro+$burstCount+1	
		let preproCount=prepro
		
		while [ $burstCount -gt 0 ]
		do
			echo -ne "#"
			let burstCount=$burstCount-1
		done	
	
		read -n 1 -s
		echo -ne "|\n"
		let counter=$counter+1
	done

	#Reset Counters
	let counter=0
	let burstTime=0
	
	# Display Burst Times
	echo -ne "Burst    0"

	while [ $counter -lt ${#arrsj[@]} ]
	do
		burst=$(echo ${arrsj[$counter]} | awk -F"-" '{print $1}')
		burstCount=$burst
		
		let burstTime=$burstTime+$burst
		
		while [ $burstCount -gt 0 ]
		do
			echo -ne " "
			let burstCount=$burstCount-1
		done
		echo -ne $burstTime

		let counter=$counter+1

	done

	echo -e "\n\n----------------------------------------------\n| SJF algorithm sorts processes in the que   |\n| on their completion time, the shortest to  |\n| finish will be first and the longest will  |\n| be last.                                   |\n----------------------------------------------";
	echo -e "\n\nPress enter to return to the main menu...";
	read -n 1 -s
	
	#Return to Main Menu
	menuScreen;
}
