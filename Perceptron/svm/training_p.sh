#!/bin/bash

mkdir models
mkdir results

# generate models for training files
for i in 0 1 2 3 4 5 6 7 8 9
do
	echo "\n"
	# linear
	./svm_learn -c 1 ./Files/digit_train${i}_svml.dat ./models/${i}_linear.model
	echo "\n"
	# polynomial
	./svm_learn -c 1 -t 1 -d 8  ./Files/digit_train${i}_svml.dat ./models/${i}_polynomial.model
	echo "\n"
	# gaussian: gamma = 0.005; for sigma  = 10
	./svm_learn -c 1 -t 2  -g 0.005 ./Files/digit_train${i}_svml.dat ./models/${i}_gaus.model
done


