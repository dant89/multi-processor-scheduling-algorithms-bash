#!/bin/bash

function demosrt {

	clear;
	
	echo -e "Shortest Remaining Time (SRT) Tutorial\n";
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
		
	#Reset/Declare Counters
	counter=0
	let prepro=0
	let preproCount=0
	let totalBurst=1
	
	clear
	echo -e "Shortest Remaining Time (SRT) Demonstration\n"
	echo -e "Press enter to view step by step..\n"
	
	# Display Burst Graph
	while [ $counter -lt ${#arrsj[@]} ]
	do
		# Sort array on loop
		arrsj=( $(numsort) )
		key=$(echo ${arrsj[$counter]} | awk -F"-" '{print $2}')
		burstCount=$(echo ${arrsj[$counter]} | awk -F"-" '{print $1}')	

		while [ $burstCount -gt 0 ]
		do
			echo -ne "P$key       "
			
			while [ $preproCount -gt 0 ]
			do
				echo -ne "  "
				let preproCount=$preproCount-1
			done
			
			echo -ne "|#|\n"
			
			read -n 1 -s
			
			let prepro=$prepro+$burstCount	
			let preproCount=$totalBurst
			let burstCount=$burstCount-1 # Gets burst time
			let totalBurst=$totalBurst+1 # Used for Burst Times
		done
		
		let counter=$counter+1
	done

	#Reset Counters
	let counter=1
	let burstTime=0
	
	# Display Burst Times
	echo -ne "Burst    0 "

	while [ $counter -lt $totalBurst ]
	do
		echo -ne $counter" "
        let counter=$counter+1
	done

	echo -e "\n\n----------------------------------------------\n| After each process burst the que is sorted |\n| on remaining burst time, newly inserted    |\n| processes take a place in the que pre sort.|\n----------------------------------------------";
	echo -e "\n\nPress enter to return to the main menu...";
	read -n 1 -s

	#Return to Main Menu
	menuScreen;
}
