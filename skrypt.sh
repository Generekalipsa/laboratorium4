#!/bin/bash

while test $# -gt 0; do
	case "$1" in
		--help | -h)
			echo "Usage: ./skrypt.sh [OPTION]
-d, --date					Show date
-l, --logs <LOG_NUMBER>			Create logs (default 100)
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
		--init)
			pwd_dir=$(pwd)
			cd pwd_dir
			git clone https://github.com/Generekalipsa/laboratorium4.git
			PATH=$PATH:$pwd_dir
			shift
			;;
		*)
			echo "$1 flag does not exist"
			return 1;
			;;
	esac
done
