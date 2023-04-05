#!/bin/bash

while test $# -gt 0; do
	case "$1" in
		--help | -h)
			echo "Usage: ./skrypt.sh [OPTION]
-d, --date					Show date
-l, --logs <LOG_NUMBER>				Create logs (default 100)
--init						Clone git repo and add script path to PATH
-e, --error <LOG_NUMBER>			Create logs (default 100)
-h, --help					Show this help message"
			exit 0
			shift
			;;
		--date | -d)
			date
			shift
			;;
		--logs | -l)
			script_name=$(basename $0)
			file_date=$(date)
			if [ $2 ]; then
				for x in $(seq 1 $2)
					do 
						mkdir log$x
						echo "log$x.txt $script_name $file_date" > log$x/log$x.txt
					done
					shift
			else
				for x in {1..100}
					do 
						mkdir log$x
						echo "log$x.txt $script_name $file_date" > log$x/log$x.txt
					done
					shift
			fi
			shift
			;;
		--init)
			pwd_dir=$(pwd)
			cd pwd_dir
			git clone https://github.com/Generekalipsa/laboratorium4.git
			PATH=$PATH:$pwd_dir
			shift
			;;
		--error | -e)
			if [ $2 ]; then
				for x in $(seq 1 $2)
					do 
						mkdir error$x
						echo "error$x.txt $script_name $file_date" > error$x/error$x.txt
					done
					shift
			else
				for x in {1..100}
					do 
						mkdir error$x
						echo "error$x.txt $script_name $file_date" > error$x/error$x.txt
					done
					shift
			fi
			shift
			;;
		*)
			echo "$1 flag does not exist"
			exit 1;
			;;
	esac
done
