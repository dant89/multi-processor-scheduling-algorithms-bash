#!/bin/bash

function demorr {

	clear;
	
	echo -e "Round Robin (RR) Tutorial\n";
	echo "How many processes would you like to use?";

	declare -a readburst
	let counter=0
	let totalburst=0
	
	# Read Process Inputs
	read processes

	while [ $counter -lt $processes ]
	do
		echo "Please enter burst time "$(($counter+1))": "
		read bursttime
		readburst=( "${readburst[@]}" "$bursttime")
		let totalburst=$totalburst+$bursttime
	
		let counter=$counter+1
	done

	let totalburstfinal=$totalburst
	let totalspace=0
	let totalspacecount=0
	let counter=0
	
	clear
	echo -e "Round Robin (RR) Demonstration\n"
	echo -e "Press enter to view step by step..\n"
	
	# Display Burst Graph
	while [ $totalburst -gt 0 ]
	do
		let keycount=0
		let readburstcount=${#readburst[@]}

		while [ $keycount -lt $readburstcount ]
		do			
				
			if [ ${readburst[$keycount]} -gt 0 ]; then
				
				echo -ne "P$((keycount+1))       "
				
				while [ $totalspacecount -gt 0 ]
				do	
					echo -ne "   "
					let totalspacecount=$totalspacecount-1
				done
							
				let readburst[$keycount]=${readburst[$keycount]}-1
					
				echo -ne "|##|\n"
				read -n 1 -s
				
				let totalspace=$totalspace+1
				let totalspacecount=totalspace
			fi
		
			let keycount=$keycount+1
			
		done

		
		let totalburst=$totalburst-1
	done

	let totalburst=$totalburstfinal+1
	let counter=1
	
	echo -ne "Time     0  "

	while [ $counter -lt $totalburst ]
	do
		#If the time is two digits then this stops the scale being inconsistant
		if [ $counter -lt 10 ]; then
			echo -ne $counter"  "
		else
			echo -ne $counter" "
		fi
		
        let counter=$counter+1
	done

	#echo $totalburstfinal

	
	echo -e "\n\n----------------------------------------------\n| Each process is split into quantums that   |\n| have a pre set size, the process quantums  |\n| are then looped through until complete.    |\n----------------------------------------------";
	echo -e "\n\nPress enter to return to the main menu...";
	read -n 1 -s
	
	#Return to Main Menu
	menuScreen;
}
