# multi-processor-scheduling-algorithms-bash

The purpose of this project was to create a step by step interactive teaching aid that would demonstrate the multiple processor scheduling algorithms.

To enable interaction in my program, I decided to allow the user to enter the amount of processes they would like to use and the time for each process to complete. This allowed each algorithm demonstration to show multiple examples via the use of dynamic code.

To allow for simpler management of the program I decided to split the separate algorithms into functions, this meant they could be in their own files and included as sources in the main program script. This also allowed the user better navigation of the program as the main menu was only ever a few steps away and allowed full access to all algorithm demonstrations and program shutdown.

## User Guide

Via command line type: `bash  main.sh` and the program will start.

The user will be shown a welcome screen with options 0-4 that allow simple navigation.

Once a user picks a process they will be asked to complete the required inputs and then press enter to watch the graph step by step, a brief explanation is then given about the algorithm before they are returned to the main menu to make their next choice.

To shut down the program the user can type 0 at the main menu and it will exit safely.
