#!/bin/sh


export args_list="-C -F --all --params"
export run_all_tests=0
export terminal_test=""
export file_names=""
export params_list="--perf --tz --metrics-brief -v"
export time_to_run=30
export cpu_instance=0

export   all_tests="crypt \
					cpu-online \
					hdd \
					matrix \
					seek \
					sock \
					pipe \
					mq \
					bsearch \
					lsearch"


####basic stress-ng testing

. ./lib/sh-test-lib
echo "About to run stress-ng-test ..."

#Command: -C := if passing testcases via terminal
#Command: -F := if passing testcases from a file    

#Usage: ./stress-ng-test-script.sh -C testcase1 testcase2 ... -F filename1 filename2 ... --all --params param1 param2 param3 .. --time 30 --cpu_instance 1
usage_func() {
    echo "Usage: ${0} [ -C "testcase1 testcase2 ..." ]
				    [ -F "filename1 filename2 ..." ]
				    [ --all 0]
				    [ --params "param1 param2 param3 .." ]
				    [ --time 30 ]
				    [ --cpu_instance 0 ]	" 
    
    exit 0
}


run_stress_ng_test(){
	echo "Running $1 Test"
	stress-ng --$1 $cpu_instance -t $time_to_run $params_list 2>&1 | tee result.txt 
	VAR=$(grep -c " successful " result.txt )
	lava_test_result_stress_ng "$1-test" $VAR
	unset VAR
	rm result.txt 
}

stress_ng_test_cases_terminal(){
	for i in $@
	do
	run_stress_ng_test $i
	done
}

stress_ng_test_cases_file(){
	for i in $file_names
	do
		filename=$i
		while read line; do
			#echo $line
			run_stress_ng_test $line
		done < $filename
	done
}



parse_argument(){

	while [ -n "$1" ] 
	do
		#echo $1
		case $1 in
			-C)	
				shift
				export terminal_test="$1" 
				shift ;;

			-F)
				shift
				export file_names="$1" 
				shift ;;
			--params)
				shift
				export params_list="$1" 
				shift ;;
			--time)
				shift
				export time_to_run=$1 
				shift ;;
			--cpu_instance)
				shift
				export cpu_instance=$1 
				shift ;;
			--all)
				shift
				export run_all_tests=$1 
				shift ;;
			*) 
				echo "Invalid Arguments"
				usage_func
				;;
		 esac
	done
}

main_function(){
	#checking for arguments
	[ "$#" -lt 1 ] && usage_func

	args="$@"
	Command_arg=$1

	parse_argument "$@"

	if [ "${run_all_tests}" -eq 1 ]; then 
		#echo $all_tests
		stress_ng_test_cases_terminal $all_tests
	else
		if [ -n terminal_test ]; then
			stress_ng_test_cases_terminal $terminal_test
		fi
		if [ -n file_names ]; then
			stress_ng_test_cases_file
		fi
	fi
	
}

#Running the script
main_function "$@"

