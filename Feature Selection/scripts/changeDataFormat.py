#!/usr/bin/python

# author : prashant kuntala
# date   : 31st October, 2016

# script that changes the data format of the Nfeature files to svm-light format files.

import os,random,math
import re,csv,datetime
import subprocess


myfiles = list()
path = os.getcwd()
path = path+"/Nfeatures/"

#listing all files in the Nfeatures folder
myfiles = os.listdir(path)

string = ""

print datetime.datetime.now().time()
#	./svm_learn -c 1 ./Files/digit_train${i}_svml.dat ./models/${i}_linear.model
#	./svm_classify ./Files/digit_test${i}_svml.dat ./models/${i}_linear.model ./results/${i}_linear_svm.result


# below the make file svmclassify is wrong since didnt give the validation data.
def genMakeFile():

	"""
	This function generates the make file for the svm-light execution for all the Nfeature files.
	"""
	svmfiles = os.listdir(path+"svmfeatures/")
	mfile = open(os.getcwd()+"/Makefile","w")
	mfile.write("all:\n")
	mfile.write("\tmkdir ./Nfeatures/svmfeatures/models\n\tmkdir ./Nfeatures/svmfeatures/results\n")
	svmfiles.sort()
	for sf in svmfiles:
		if (re.search("N*valid_svml.dat",sf)):
			continue;
		else :
			string = "\t"+"./svm_learn -c 1 ./Nfeatures/svmfeatures/"+sf+" ./Nfeatures/svmfeatures/models/"+sf[:-4]+"_linear.model\n"
			mfile.write(string)
			string = "\t"+"./svm_classify ./Nfeatures/svmfeatures/"+sf[:-9]+"valid_svml.dat"+" ./Nfeatures/svmfeatures/models/"+sf[:-4]+"_linear.model ./Nfeatures/svmfeatures/results/"+sf[:-4]+"_linear.result\n"
			mfile.write(string)
			#need to change this part to take the validation files.

def createLine(myline,mylist):

		"""
		This function creates the <line> elements necessary for the input file for svm-light 
		"""

		for i in range(0,len(mylist)-1):
			if(float(mylist[i]) == 0.0):
				continue
			else:
				myline = myline + " " +str(i+1)+":"+mylist[i]
		myline = myline +" "+"#"+" "+ mylist[0]+"\n"
		return myline




os.mkdir(path+"svmfeatures")
for f in myfiles :
	datafile = open(path+f,"r")
	data = csv.reader(datafile,delimiter=",")


	print f
	# creating the correct formatted file to input the svm_light
	outfile = open(path+"/svmfeatures/"+f[:-4]+"_svml.dat","w")
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

#function that calls make file generated that executes the svmlight
def callMake() :
	"""
	This function executes the makefile created for running tomtom and runs tomtom to compare seeds against the database.pwm file	
	"""
	makepath = os.getcwd()+"/"
	p = subprocess.Popen(["make"],stdout=subprocess.PIPE,cwd=makepath)
	for line in p.stdout:
	    print(line.decode().strip())
	return

genMakeFile()
callMake()
