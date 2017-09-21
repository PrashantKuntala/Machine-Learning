#!/usr/bin/python

import os,random,math
import re,csv,datetime

myfiles = list()
path = os.getcwd()
path = path+"/Files/"
myfiles = os.listdir(path)

print datetime.datetime.now().time()

def createLine(myline,mylist):

		"""
		This function creates the <line> elements necessary for the input file for svm-light 
		"""

		for i in range(1,len(mylist)-1):
			if(float(mylist[i]) == 0.0):
				continue
			else:
				myline = myline + " " +str(i)+":"+mylist[i]
		myline = myline +" "+"#"+" "+ mylist[0]+"\n"
		return myline


for f in myfiles :
	datafile = open(path+f,"r")
	data = csv.reader(datafile,delimiter=",")


	print f
	# creating the correct formatted file to input the svm_light
	outfile = open(path+f[:-4]+"_svml.dat","w")
	#each row in the data is a list
	for row in data:
		line = ""
		listm = row
		#print  listm[92] + " "+ str(len(listm))
		length = len(listm)-1
		#print length
		if(int(listm[length]) == 1):
			line = line+"+1"
			#print "inside  == 1 " +listm[length]
			line = createLine(line,listm)
		else:
			line = line+"-1"
			#print listm[length]
			line = createLine(line,listm)
		outfile.write(line)
	outfile.close() 


print datetime.datetime.now().time()


