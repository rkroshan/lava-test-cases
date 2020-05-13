#!/bin/sh

####basic stress-ng testing

. ./lib/sh-test-lib
echo "About to run stress-ng-test ..."


#TestName:- crypt-Test
#Description:- encrypt a 16 character random password using crypt
#More Info:- https://www.github.com/ColinIanKing/stress-ng/blob/master/stress-crypt.c

crypt_test(){
	echo "Running Crypt Test"
	stress-ng --crypt 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt )
	lava_test_result_stress_ng "crypt-test" $VAR
	unset VAR
	rm result.txt 
}

#TestName:- cpu-online
#Description:- Put Randomly selected CPUs offline and online. (require root access)
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-cpu-online.c

cpu_online_test(){
	echo "Running cpu-online Test"
	stress-ng --cpu-online 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt )
	lava_test_result_stress_ng "cpu-online-test" $VAR
	unset VAR
	rm result.txt
}

#TestName:- bsearch
#Description:- start binarysearch of asorted array of 32 bit integers using bsearch.
#More Info:-  https://github.com/ColinIanKing/stress-ng/blob/master/stress-bsearch.c

bsearch_test(){
	echo "Running bsearch Test"
	stress-ng --bsearch 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt ) 
	lava_test_result_stress_ng "bsearch-test" $VAR
	unset VAR
	rm result.txt
}

#TestName:- Matrix
#Description:- perform various matrix operations on floating point values.
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-matrix.c

matrix_test(){
	echo "Running Matrix Test"
	stress-ng --matrix 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt )
	lava_test_result_stress_ng "matrix-test" $VAR
	unset VAR
	rm result.txt  
}

#TestName:- lsearch
#Description:- linear search of unsorted array of 32 bit integers using lsearch
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-lsearch.c

lsearch_test(){
	echo "Running lsearch Test"
	stress-ng --lsearch 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt )
	lava_test_result_stress_ng "lsearch-test" $VAR
	unset VAR
	rm result.txt
}

#TestName:- hdd
#Description:- continually writing, reading and removing temporary files.
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-hdd.c

hdd_test(){
	echo "Running hdd Test"
	stress-ng --hdd 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt )
	lava_test_result_stress_ng "hdd-test" $VAR
	unset VAR
	rm result.txt
}

#TestName:- seek
#Description:- randomly seeksand performs 512 byte read/write I/O operations on a file
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-seek.c

seek_test(){
	echo "Running seek Test"
	stress-ng --seek 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt )
	lava_test_result_stress_ng "seek-test" $VAR
	unset VAR
	rm result.txt
}

#TestName:- pipe
#Description:- perform large pipe writes and reads to exercise pipe I/O.
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-pipe.c

pipe_test(){
	echo "Running pipe Test"
	stress-ng --pipe 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt )
	lava_test_result_stress_ng "pipe-test" $VAR
	unset VAR
	rm result.txt
}

#TestName:- sock
#Description:- perform various socket stress activity
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-sock.c

sock_test(){
	echo "Running sock Test"
	stress-ng --sock 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt )
	lava_test_result_stress_ng "sock-test" $VAR
	unset VAR
	rm result.txt
}

#TestName:- mq
#Description:- start sender and receiver processes that continually sendand receive messages using POSIX message queues.
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-mq.c

mq_test(){
	echo "Running mq Test"
	stress-ng --mq 0 -t 30 --perf --tz --metrics-brief -v 2>&1 | tee result.txt 
	VAR=$(grep -c "successful" result.txt )
	lava_test_result_stress_ng "mq-test" $VAR
	unset VAR
	rm result.txt
}


(crypt_test)
# (cpu_online_test)
# (bsearch_test)
# (matrix_test)
# (lsearch_test)
# (hdd_test)
# (seek_test)
# (pipe_test)
# (sock_test)
# (mq_test)