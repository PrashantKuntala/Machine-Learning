function [MaxACC] = kernelPerceptronExp(trainvector,testvector,epoch,d)
tic;

# training perceptrons
 Acount = zeros(20,1); #stores accuracy for each epoch usually on [1:20]

# polynomial kernel function
function b = Tkernel(X,Y,d)
k = (1+X*Y').^d;
b=k;
end
X = [ones(rows(trainvector),1) trainvector(:,[1:columns(trainvector)-1])]; # creating the feature vector.

Y = [ones(rows(testvector),1) testvector(:,[1:columns(testvector)-1])]; # creating the feature vector.
TK = Tkernel(X,Y,d);
size(TK);
for T = epoch # should be done for 1 to 20
	alpha = []; # matrix that stores the weight vectors of [0 to 9] for each T = [1 to 20] this is a 65x10 matrix
	Tlabel = [];
	#training for T = 1 on all digits 0 to 9 on the training set.

	for digit = 0:9
		fname = strcat("digit_train",num2str(digit),".dat"); # running perceptron on each digit
		alpha = [alpha polynomialperceptron(fname,T,d)]; # appending column vectors of Wd return for each digit
		dt = load(fname);
		Tlabel = [Tlabel dt(:,columns(dt))];
		# the vectors returned by perceptron are in the normalized form.	
	end
		printf("finished T = %d , columns for alpha : %d \n",T,columns(alpha));

	# Testing for T = 1 on all digits 0 to 9 on the Development set

		
	
	# test vector has already been feature scaled in this case.	
	

	# calculating F(xd) for all the examples
	#fxd = [];

	TK = TK';
	fxd=zeros(rows(TK),10);
	#size(TK)
#size(Tlabel)
#size(alpha)
#size(fxd)
        for ex = 1:rows(TK)
	for d = 0:9
	fxd(ex,d+1) = TK(ex,:) * (Tlabel(:,d+1).*alpha(:,d+1));
	#printf("size of dp : %d \n",size(dp));
	#fxd = [fxd dp];
	end
	end
	printf("size of fxd : %d \n",size(fxd));

	
	fxd = fxd';
#size(fxd)
	Ylabel = zeros(rows(X),1);	
	confusionMatrix=zeros(10,10);
	# getting the highest value of F(xd) to assign the label for that example and also creating the confusion matrix
	for i = 1:columns(fxd)	
	[maxvalue , maxindex] = max(fxd(:,i));
	Ylabel(i) = maxindex -1 ;
	Tlab = testvector(:,columns(testvector));
	if( Ylabel(i) == Tlab(i))
		Acount(T) = Acount(T) + 1;
		confusionMatrix(Tlab(i)+1,Ylabel(i)+1) = confusionMatrix(Tlab(i)+1,Ylabel(i)+1) + 1;
	else
		#printf("ylabel : %d , tlabel : %d \n",Ylabel(i),Tlabel(i));
			confusionMatrix(Tlab(i)+1,Ylabel(i)+1) = confusionMatrix(Tlab(i)+1,Ylabel(i)+1) + 1;
	endif
	end	
        confusionMatrix
	sum(confusionMatrix(:))

end
#Acount
[MaxACC,index] = max(Acount');

#MaxACC
#index
toc;
end

