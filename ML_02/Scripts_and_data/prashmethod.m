#
# Author  : Prashant Kumar Kuntala
# problem : Digit recognition

# Algorithm : linear perceptron, Average perceptron, polynomial Kernel perceptron, average Kernel perceptron and Gaussian kernel perceptron
#
#

# NOTE : This script is written for octave, This script does all the experiments related to the Homework assignment.
#	 IF you want to perform each test / experiment separately comment out each section and it will work for that particular segment
#	 The code does Training as well as testing once a good parameter is reached. 

# WARNING : gaussian kernels take long to finish , around 5hrs. hence initially commented out

#load the train data and test data
data = load("optdigits.tra"); # reading the training files.
tdata = load("optdigits.tes"); # reading the test files.
[m,n] = size(data);


# seperate the development and train sets from train data
devset = data([1:1000],:);
trainset = data([1001:m],:);
testset = tdata(:,[1:columns(tdata)-1]); # doesnt contain the labels of testdata

#creating devset and trainset files.
#dlmwrite("devset.txt",devset);
#dlmwrite("trainset.txt",trainset);

#function to scale any data set ( doesnt add x0 and ignores column label)
function temp = featureScale(vector)
	temp = vector(:,[1:columns(vector)-1]); #creating a vector excluding the label
	
	for c = 1:columns(temp)
		mini = min(temp(:,c));
		maxi = max(temp(:,c));
		range = maxi-mini;
		for r = 1:rows(temp)
			value = temp(r,c) - mini;
			if( value <=0)
				value = 0;
			else
				value = value/range;
			endif
			temp(r,c) = value;
		end	
	end
end

# function that does feature scaling for given dataset and creates the files for each digit.
#tic;
function featureScaleAndCreateFiles(nrows,vector,filename)
	temp = featureScale(vector);

	temp2 = zeros(nrows,1);       # generating the label for that digit and confroming to one vs rest scenario.
	t = vector(:,columns(vector));
	for j = 0:9
		for i = 1:rows(vector)
			if(t(i) == j)
			  temp2(i) = 1;
			else
			  temp2(i) = -1;
			endif
		end
	
	ndata = [temp temp2];
	fname = strcat(filename,num2str(j),".dat"); # creating the filename for each digit
	dlmwrite(fname,ndata);			    # writing contents into the file. example: digit_train0.dat 
	end
end
#toc;

# create files for each digit
#featureScaleAndCreateFiles(rows(devset),devset,'digit_dev'); # for development data rows = 1000
#featureScaleAndCreateFiles(rows(trainset),trainset,'digit_train'); # for train data rows = 2823
#featureScaleAndCreateFiles(rows(tdata),tdata,'digit_test');# for test data rows =1787
# above files doesnt contain the x0  feature.
# x0 is being added in the perceptron algo. and accordingly returns a 65x1 vector.

# part 5d  Experiments on PERCEPTRONS --------------------------------------------------------------------------------------------

#feature scaling data before using.
temp3 = tdata(:,columns(tdata));
tdata = [featureScale(tdata) temp3];

#creating a featurescaled testdata file.
dlmwrite("testdata.txt",tdata);

temp3 = devset(:,columns(devset));
devset = [featureScale(devset) temp3];

temp3 = trainset(:,columns(trainset));
trainset = [featureScale(trainset) temp3];


#getting the best Epoch on train data
tic;
[MaxACC,myT]  = getMaxAccEpoch(trainset,devset,[1:20])
myT
toc;

#testing on linear perceptron
tic;
[MaxACC,index]  = linearPerceptronExp(trainset,tdata,myT)
toc;


#testing on average perceptron
tic;
[MaxACC,index] = avgPerceptronExp(trainset,tdata,myT)
toc;


#Getting the best degree for polynomial kernel perceptron
nextT = zeros(6,1); # used to store the accuracy of for each degree
for degree = 2:6
nextT(degree) = kernelPerceptronExp(trainset,devset,myT,degree)
end
nextT;
[mdacc,mdi] = max(nextT) #picking the d with max accuracy.
mdi

#Testing polynomial kernel perceptron on Testdata fixing degree to mdi
nextT = zeros(1,1);
nextT = kernelPerceptronExp(trainset,tdata,myT,mdi)
printf(" The Testdata Accuracy using kernelPerceptron is : %d\n",nextT);

#Testing Average polynomial kernel perceptron on Testdata fixing degree to mdi
nextT = zeros(1,1);
nextT = avgKernelPerceptronExp(trainset,tdata,myT,mdi)
printf(" The Testdata Accuracy using Average kernel perceptron is : %d\n",nextT);


#Tuning the best sigma on gaussian kernel perceptron
#tic;
#nextT = zeros(5,1); # used to store the accuracy of for each degree
#for sigma = [0.1 0.5 2 5 10]
#printf("running for sigma : %d\n",sigma);
#nextT = gauskernelPerceptronExp(trainset,devset,myT,sigma)
#end
#nextT
#[msigma,msi]=max(nextT); #picking the sigma with max accuracy.
#msi
#toc;

#testing gaussian kernel perceptron
#tic;
#nextT = gauskernelPerceptronExp(trainset,tdata,myT,msi)
#toc;


