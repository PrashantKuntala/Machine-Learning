#!/usr/bin/python

#
# author : prashant kuntala
# date   : 29th October,2016

# last modified : 10/29/16

# script that takes the input of a file in the format of SVM-light and generates a feature file, including the zero features.

import os,re

cwd = os.getcwd()
#print cwd

def generate(inputfile,outputfile):
	
	"""
        This function generates the feature files for the given data file.
	"""
	filepath = open(cwd+"/"+inputfile,"r")

	openfile = open(cwd+"/"+outputfile,"w")

	example = list()
	prev = 0
	string = ""
	for line in filepath:
		#print line
		line.strip()
		example = line.split(" ")
		#print "The number of features in example " + str(len(example))
		for f in example:
			f.strip()
			a = f.split(":")
			if(a[0] != "\n"):
				value = int(a[0]) - prev		
				prev = int(a[0])
				for i in range(0,value-1):
					#print "0"
					string = string + '0,'
				#print a[1]
				string = string + a[1]+","
		v = 20000 - int(prev)
		for k in range(0,v):
			#print "0"
			string = string + '0,'		
		openfile.write(string+"\n")
		string = ""
		prev = 0	
			#prev = a[0]
			#string = string+a[1]+","
		
#print string

generate("dextertraindata.dat","features.dat")
generate("dextervaliddata.dat","validfeatures.dat")

