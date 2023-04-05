#!/bin/bash

while test $# -gt 0; do
	case "$1" in
		--date)
			date
			shift
			;;
		*)
			echo "$1 flag does not exist"
			return 1;
			;;
	esac
done
