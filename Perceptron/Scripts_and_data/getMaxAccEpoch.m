function [MaxACC,index,Wd]  = getMaxAccEpoch(trainvector,testvector,epoch)
tic;
# training perceptrons
 Acount = zeros(20,1); #stores accuracy for each epoch usually on [1:20]

for T = epoch # should be done for 1 to 20
	Wd = []; # matrix that stores the weight vectors of [0 to 9] for each T = [1 to 20] this is a 65x10 matrix

	#training for T = 1 on all digits 0 to 9 on the training set.

	for digit = 0:9
		fname = strcat("digit_train",num2str(digit),".dat"); # running perceptron on each digit
		Wd = [Wd perceptron(fname,T)]; # appending column vectors of Wd returned for each digit
		# the vectors returned by perceptron are in the normalized form.	
	end
		printf("finished T = %d , columns for Wd : %d \n",T,columns(Wd));

	# Testing for T = 1 on all digits 0 to 9 on the Development set
	size(Wd)
	X = [ones(rows(testvector),1) testvector(:,[1:columns(testvector)-1])]; # creating the feature vector.
	Tlabel = testvector(:,columns(testvector));	
	
	size(X)
	# calculating F(xd) for all the examples
	fxd = [];
	for d = 0:9
	dp = X * Wd(:,d+1);
	fxd = [fxd dp];
	end
	size(fxd)
	fxd = fxd';
	Ylabel = zeros(rows(X),1);	
	confusionMatrix=zeros(10,10);
	# getting the highest value of F(xd) to assign the label for that example and also creating the confusion matrix
	for i = 1:columns(fxd)	
	[maxvalue , maxindex] = max(fxd(:,i));
	Ylabel(i) = maxindex -1 ;
	if( Ylabel(i) == Tlabel(i))
		Acount(T) = Acount(T) + 1;
		confusionMatrix(Tlabel(i)+1,Ylabel(i)+1) = confusionMatrix(Tlabel(i)+1,Ylabel(i)+1) + 1;
	else
			confusionMatrix(Tlabel(i)+1,Ylabel(i)+1) = confusionMatrix(Tlabel(i)+1,Ylabel(i)+1) + 1;
	endif
	end
confusionMatrix
sum(confusionMatrix(:))	
        

end

Acount
[MaxACC,index] = max(Acount');

#MaxACC
#index
toc;
end

