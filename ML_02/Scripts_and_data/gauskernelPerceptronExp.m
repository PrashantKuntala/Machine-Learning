function [MaxACC] = gauskernelPerceptronExp(trainvector,testvector,epoch,d)
tic;
# training perceptrons
 Acount = zeros(10,1); #stores accuracy for each epoch usually on [1:20], as of now epoch is fixed

# gaussian kernel function
function [K] = Tkernel(data1,data2,sig)
[m1,n1] = size(data1);
[m2,n2] = size(data2);
x = ones(m1,n1);
x(:,2:n1) = data1(:,1:n1-1);
y = ones(m2,n2);
y(:,2:n2) = data2(:,1:n2-1);

K = zeros(m1,m2);
for i = 1:m1
    for j = 1:m2
K(i,j) = exp(-norm(x(i,:)-(y(j,:))).^2/2/sig.^2);
    end
end

end



#function [K] = Tkernel(data1,data2,sig)
#[m1,n1] = size(data1);
#[m2,n2]=size(data2);
#K = zeros(m1,m2);
#for i = 1:m1
#    for j = 1:m2
#K(i,j) = exp((-norm(data1(i,:)-(data2(j,:))).^2/2/(sig*sig)));
#    end
#end#

#end

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
		alpha = [alpha gausperceptron(fname,T,d)]; # appending column vectors of Wd return for each digit
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

	for d = 0:9
        for ex = 1:rows(TK)
	TK(ex,:);
	fxd(ex,d+1) = TK(ex,:) * (Tlabel(:,d+1).*alpha(:,d+1));
	#printf("size of dp : %d \n",size(dp));
	#fxd = [fxd dp];
	end
	end
	#printf("size of fxd : %d \n",size(fxd));

	
	fxd = fxd';

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
		#printf("ylabel : %d , tlabel : %d \n",Ylabel(i),Tlab(i));
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

