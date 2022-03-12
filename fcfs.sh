#!/bin/bash

function demofcfs {
	
	clear;
	
	echo -e "First Come First Served (FCFS) Tutorial\n";
	echo "How many processes would you like to use?";
	
	declare -a total
	let counter=0
	
	# Read Process Inputs
	read processes;
	
	while [ $counter -lt $processes ]
	do
		echo "Please enter burst time "$(($counter + 1))": "
		read bursttime
		total=( "${total[@]}" "$bursttime" )
		
		let counter=$counter+1
	done
	
	#Reset/Declare Counters
	counter=0
	let prepro=0
	let preproCount=0
	
	clear
	echo -e "First Come First Served (FCFS) Demonstration\n"
	echo -e "Press enter to view step by step..\n"

	# Display Burst Graph
	while [ $counter -lt ${#total[@]} ]
	do		
		let process=$(echo ${total[$counter]})	
		
		echo -ne "P"$(($counter + 1))"       "
		
		while [ $preproCount -gt 0 ]
		do
			echo -ne " "
			let preproCount=$preproCount-1
		done
		
		echo -ne "|"
		
		let prepro=prepro+$(echo ${total[$counter]})+1	
		let preproCount=prepro
		
		while [ $process -gt 0 ]
		do
			echo -ne "#"
			let process=$process-1
		done
		
		read -n 1 -s
		echo -ne "|\n"
		let counter=$counter+1
	done
	
	#Reset/Declare Counters
	counter=0 
	let burst=0
	
	# Display Burst Times
	echo -ne "Burst    0"
	
	while [ $counter -lt ${#total[@]} ]
	do	
		
		let process=$(echo ${total[$counter]})	

		burst=$(($process+$burst))
		
		while [ $process -gt 0 ]
		do
			echo -ne " "
			let process=$process-1
		done
		
		echo -ne $burst
		let counter=$counter+1
	done
	
	echo -e "\n\n----------------------------------------------\n| FCFS algorithm sorts processes in the que  |\n| on their arrival time, the first to arrive |\n| will be the first to complete and the last |\n| arrival will be the last to complete.      |\n----------------------------------------------";
	echo -e "\n\n\nPress enter to return to the main menu...";
	read -n 1 -s

	#Return to Main Menu
	menuScreen;
}