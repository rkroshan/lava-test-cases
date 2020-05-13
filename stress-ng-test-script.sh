#!/bin/sh

####basic stress-ng testing

. ./lib/sh-test-lib
echo "About to run stress-ng-test ..."

#Command: -C := if passing testcases via terminal
#Command: -F := if passing testcases from a file

#Usage: ./stress-ng-test-script.sh -C testcase1 testcase2 ...
#Usage: ./stress-ng-test-script.sh -F filename1 filename2 ...
usage_func() {
    echo "Usage: ${0} -C testcase1 testcase2 ...		#if passing testcases via terminal " 
    echo "Usage: ${0} -F filename1 filename2 ...		#if passing testcases from a file" 
    exit 0
}


run_stress_ng_test(){
	echo "Running $1 Test"
	stress-ng --$1 0 -t 5 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c " successful " result.txt )
	lava_test_result_stress_ng "$1-test" $VAR
	unset VAR
	rm result.txt 
}

stress_ng_test_cases_terminal(){
	shift
	for i in "$@"
	do
	run_stress_ng_test $i
	done
}

stress_ng_test_cases_file(){
	shift
	for i in "$@"
	do
		filename=$i
		while read line; do
			echo $line
			run_stress_ng_test $line
		done < $filename
	done
}

main_function(){
	#checking for arguments
	[ "$#" -lt 1 ] && usage_func

	args="$@"
	Command_arg=$1

	if [ "${Command_arg}" = "-C" ]; then
		stress_ng_test_cases_terminal "$@"
	elif [ "${Command_arg}" = "-F" ]; then
		stress_ng_test_cases_file "$@"
	else
		echo "wrong arguments"
		usage_func
	fi
}

#Running the script
main_function "$@"

