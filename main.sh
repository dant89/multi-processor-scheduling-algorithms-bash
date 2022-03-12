#!/bin/bash

source fcfs.sh
source sjf.sh
source rr.sh
source srt.sh

#The script runs via functions that are stored in seperate files to allow for easy
#editing and maintaining of each seperate algorithm

function menuScreen {

	clear;
	
	menu="Welcome to the Processor Scheduling Tutorial\n\nNonpreemptive\n     
1.First Come First Served (FCFS)\n     2.Shortest Job First (SJF)\n\nPreemptive\n    3.Round Robin (RR)\n     
4.Shortest Remaining Time (SRT)\n\n0. Exit Program\n\n";

	echo -e $menu;
	echo "Please enter a choice (0-4) ..";
	
	while read options; do
	  case "$options" in
		1) demofcfs; break ;;
		2) demosjf; break ;;
		3) demorr; break;;
		4) demosrt; break;;
		0) clear; printf "Program Shutdown, Goodbye!\n\n"; return;;
		*) printf "Incorrect input, please try again..\n" ;;
	  esac
	done
}

menuScreen;

exit 0;