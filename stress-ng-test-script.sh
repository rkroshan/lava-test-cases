#!/bin/bash

####basic stress-ng testing

. ./lib/sh-test-lib
echo "About to run stress-ng-test ..."


#TestName:- crypt-Test
#Description:- encrypt a 16 character random password using crypt
#More Info:- https://www.github.com/ColinIanKing/stress-ng/blob/master/stress-crypt.c

crypt_test(){
	echo "Running Crypt Test"
	stress-ng --crypt 0 -t 5 --perf --tz --metrics-brief -v 
	lava_test_result "crypt-test"
}

#TestName:- cpu-online
#Description:- Put Randomly selected CPUs offline and online. (require root access)
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-cpu-online.c

cpu_online_test(){
	echo "Running cpu-online Test"
	stress-ng --cpu-online 0 -t 30 --perf --tz --metrics-brief -v 
	lava_test_result "cpu-online-test"
}

#TestName:- bsearch
#Description:- start binarysearch of asorted array of 32 bit integers using bsearch.
#More Info:-  https://github.com/ColinIanKing/stress-ng/blob/master/stress-bsearch.c

bsearch_test(){
	echo "Running bsearch Test"
	stress-ng --bsearch 0 -t 30 --perf --tz --metrics-brief -v  
	lava_test_result "bsearch-test"
}

#TestName:- Matrix
#Description:- perform various matrix operations on floating point values.
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-matrix.c

matrix_test(){
	echo "Running Matrix Test"
	stress-ng --matrix 0 -t 30 --perf --tz --metrics-brief -v
	lava_test_result "matrix-test"  
}

#TestName:- lsearch
#Description:- linear search of unsorted array of 32 bit integers using lsearch
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-lsearch.c

lsearch_test(){
	echo "Running lsearch Test"
	stress-ng --lsearch 0 -t 30 --perf --tz --metrics-brief -v
	lava_test_result "lsearch-test"
}

#TestName:- hdd
#Description:- continually writing, reading and removing temporary files.
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-hdd.c

hdd_test(){
	echo "Running hdd Test"
	stress-ng --hdd 0 -t 30 --perf --tz --metrics-brief -v
	lava_test_result "hdd-test"
}

#TestName:- seek
#Description:- randomly seeksand performs 512 byte read/write I/O operations on a file
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-seek.c

seek_test(){
	echo "Running seek Test"
	stress-ng --seek 0 -t 30 --perf --tz --metrics-brief -v
	lava_test_result "seek-test"
}

#TestName:- pipe
#Description:- perform large pipe writes and reads to exercise pipe I/O.
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-pipe.c

pipe_test(){
	echo "Running pipe Test"
	stress-ng --pipe 0 -t 30 --perf --tz --metrics-brief -v
	lava_test_result "pipe-test"
}

#TestName:- sock
#Description:- perform various socket stress activity
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-sock.c

sock_test(){
	echo "Running sock Test"
	stress-ng --sock 0 -t 30 --perf --tz --metrics-brief -v
	lava_test_result "sock-test"
}

#TestName:- mq
#Description:- start sender and receiver processes that continually sendand receive messages using POSIX message queues.
#More Info:- https://github.com/ColinIanKing/stress-ng/blob/master/stress-mq.c

mq_test(){
	echo "Running mq Test"
	stress-ng --mq 0 -t 30 --perf --tz --metrics-brief -v
	lava_test_result "mq-test"
}


(crypt_test)
(cpu_online_test)
(bsearch_test)
(matrix_test)
(lsearch_test)
(hdd_test)
(seek_test)
(pipe_test)
(sock_test)
(mq_test)