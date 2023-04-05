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
			if [ $2 ]; then
				for x in $( seq 1 $2)
					do 
						echo "log$x.txt $script_name $file_date" > log$x.txt
					done
					shift
			else
				for x in {1..100}
					do 
						echo "log$x.txt $script_name $file_date" > log$x.txt
					done
					shift
			fi
			;;
		--help)
			echo "Usage: ./skrypt.sh [OPTION]
--date					Show date
--logs <LOG_NUMBER>			Create logs (default 100)
--help					Show this help message"
			exit 0
			shift
			;;
		*)
			echo "$1 flag does not exist"
			return 1;
			;;
	esac
done
