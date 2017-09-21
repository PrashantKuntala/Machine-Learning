#!/bin/bash


# using models classify the test files
for i in 0 1 2 3 4 5 6 7 8 9
do
	echo "\n"
	# classify linear egs
	./svm_classify ./Files/digit_test${i}_svml.dat ./models/${i}_linear.model ./results/${i}_linear_svm.result
	echo "\n"
	# classify polynomial egs
	./svm_classify ./Files/digit_test${i}_svml.dat ./models/${i}_polynomial.model ./results/${i}_polynomial_svm.result
	echo "\n"
	# classify gaussians egs
   	./svm_classify ./Files/digit_test${i}_svml.dat ./models/${i}_gaus.model ./results/${i}_svm_gaus.result

done
