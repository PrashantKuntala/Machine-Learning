# Experimental evaluation of linear svm and the nearest neighbour algorithm on the problem of categorizing text 
documents in the presence of irrelevant features.

**Dataset source :** [UCI Machine learning repository , Dexter Dataset](http://archive.ics.uci.edu/ml/datasets/Dexter)

**Files :** 

	dexter.testdata
	dexter.traindata
	dexter.validdata
	dexter.trainlabels
	dexter.validlabels

**Programming languages:** python (scikit learn for KNN), svm-light for linear svm, octave and shell script.

## Scritps : 
	
	generateFeature.py : converts the data files to feature file.
	normalizeData.m : Normalize the data and then create files for each top N.The rank file is hardcoded.
	changeDataformat.py: Parses through all the TOP N files generated and creates svm-light required input files and creates a makefile that runs SVM-light.
	execute.m : this ocatave script reads the predictions from the svmlight and plots the Accuraacy vs N.
	knn.py: script that uses the sklearn.neighbors.KNeighborsClassifer to run experiments, it also plots the final results for each k, k is hardcoded.
	notnormalizeData.m : used for 8d bit for comparision.
	runme.sh : This shell scripts runs the entire pipeline for the xperiment, given that you have generated the ranking files using individual ranking scripts.(The rank files generated are in ascending order, but they will be flipped before forming the ranked feature matrix)
	runme2.sh: similar to above shell script but works for non-normalized data.

NOTE: ALL THE FILTER METHODS WERE IMPLEMENTED IN SEPARATE PYTHON SCRIPTS AND MOST OF THE PARAMETERS ARE HARDCODED
