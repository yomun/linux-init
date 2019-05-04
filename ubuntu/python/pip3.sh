#!/usr/bin/env bash

funWithParam(){

	path=$1

	tot=0
	cnt=0

	PIP3_LIST=`pip3 list | awk '{print $1}'`

	for n in ${PIP3_LIST[@]}
	do
		tot=$((tot+1))

		if [ $tot -gt 2 ]
		then
			loc=`pip3 show $n | awk '{ if (substr($2,1,1) ~ /^[\/]/) print $2 }'`

			if [ ${#loc} -gt 0 ]
			then
				if [ ${#path} -eq ${#loc} ]
				then
					#if [ $cnt -eq 0 ]
					#then
					#	echo "[ $path ]"
					#fi

					cnt=$((cnt+1))
					
					echo "$((tot-2)) $n"
				fi
			fi
		fi
	done

	echo "total: $cnt"
}

array_path=`python3 os.sys.path.py | awk '{ if (index($1,"-packages") > 0) print $1 }'`

OLD_IFS="$IFS"
IFS=" "
array=($array_path)
IFS="$OLD_IFS"

for i in ${array[*]}
do
	echo "[ $i ]"
	funWithParam $i
done
