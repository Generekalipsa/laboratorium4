#!/bin/bash

while test $# -gt 0; do
	case "$1" in
		--date)
			date
			shift
			;;
		--logs)		
			script_name=$(basename $0)
			file_date=$(date)
			for x in {1..100}
				do 
					echo "log$x.txt $script_name $file_date" > log$x.txt
				done
			shift
			;;
		*)
			echo "$1 flag does not exist"
			return 1;
			;;
	esac
done
