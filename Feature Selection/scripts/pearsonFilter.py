#!/usr/bin/python

#
# author : prashant kuntala
# date   : 31th October,2016

# last modified : 11/4/16

# script that takes feature file and ranks the features based on Pearson Correlation.
from __future__ import division
import os
import numpy as np
import scipy.stats

# reading the data file into an array
data = np.genfromtxt("features.dat", delimiter = ',')
data = np.matrix(data[:,[range(0,20000)]])
print type(data)
print "dimensions of your feature vector : " + str(data.shape)

#reading the train labels
trainlabels = np.matrix(np.genfromtxt("dextertrainlabels.dat",delimiter = ','))
trainlabels = trainlabels.T
print "dimensions of your trainlabels vector : " + str(trainlabels.shape)

ymean = np.mean(trainlabels)
ystd = np.std(trainlabels)

pstRank = []
for i in range(0,20000):
	numerator = 0
	xmean = np.mean(data[:,i])
	xstd = np.std(data[:,i])
	if((xstd*ystd) == 0):
		pstRank.append(0)
	else:
		for j in range(0,300):
			numerator = numerator + ((data[j,i] - xmean)*(trainlabels[j] - ymean))
		pcc = abs(numerator.item(0)/(xstd*ystd))
		#print type(numerator)
		#print type(pcc)
		pstRank.append(pcc.item(0))
#print pstRank
pstRank = list(np.argsort(pstRank))
#print pstRank

string = ""
for i in range(0,len(pstRank)):
	string = string + str(pstRank[i]+1)+"\n"

openfile = open(os.getcwd()+"/PearsonRanking.dat","w")
openfile.write(string)
openfile.close()
