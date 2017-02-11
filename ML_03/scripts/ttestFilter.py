#!/usr/bin/python

#
# author : prashant kuntala
# date   : 31th October,2016

# last modified : 4/11/16

# script that takes feature file and ranks the features based on Ttest
from __future__ import division
import os
import numpy as np
import scipy.stats
import math

# reading the data file into an array
data = np.genfromtxt("features.dat", delimiter = ',')

# below code is necessary because during the file generation the trailing " , " is also read by numpy, so removing that blank character. 
data = np.matrix(data[:,[range(0,20000)]])
print "dimensions of your traindata : " + str(data.shape)
#print data.shape
#print type(data)

trainlabels = np.matrix(np.genfromtxt("dextertrainlabels.dat"))
trainlabels = trainlabels.T
print "dimensions of your trainlabels vector : " + str(trainlabels.shape)

ymean = np.mean(trainlabels)
ystd = np.std(trainlabels)

ttestRanking = []

rank = np.array(ttestRanking)
for i in range(0,20000):
	mplus = []
	mneg = []
	for j in range(0,300):
		if(trainlabels[j] == 1):
			#print str(data[i,j])+" -pos " + str(trainlabels[j])
			#print type(data[j,i])
			mplus.append(data[j,i])
		else :
			#print str(data[i,j])+" -neg " + str(trainlabels[j])	
			mneg.append(data[j,i])
	#print " ------------------------------------------- \n"
	mplen = len(mplus)
	mnlen = len(mneg)
	numerator = abs(np.mean(mplus) - np.mean(mneg))
	denominator = math.sqrt((np.std(mplus)**2/mplen) + (np.std(mneg)**2/mnlen))
	if(denominator == 0):
		ttestRanking.append(0)
	else:
		ttest = numerator/denominator
		ttestRanking.append(ttest)

# sorting the s2nRanking in ascending order. can use descending while reading the file in octave and flip it.
#print s2nRanking
ttestRanking = list(np.argsort(ttestRanking))
#print s2nRanking

string = ""
for i in range(0,len(ttestRanking)):
	string = string + str(ttestRanking[i]+1)+"\n"

openfile = open(os.getcwd()+"/ttestRanking.dat","w")
openfile.write(string)
openfile.close()
