#!/usr/bin/sh

# shell script to run svm on ranked data.
echo " \n\n"
date
echo " Feature Selection for the UCI Dexter data\n"
echo " Generating the feature vector from the dextertrain data .......................... \n"
date
python generateFeature.py
echo " Finished feature file generation ! \n"
date
echo " \n\n"
echo " Normalizing the feature files and creating files for TOP N ...... \n"
date
echo " \n\n"
octave -q notnormalizeData.m
echo " Finished normalizing feature data ! \n"
date
echo " Running SVM -light .............. \n"
python changeDataFormat.py
echo " Finished running svm ! \n"
date
echo " Generating the graph for accuracy vs N ............\n"
octave -q execute.m
date
echo " Finished Feature selection ! \n"
