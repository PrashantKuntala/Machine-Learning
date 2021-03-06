
function execute()

	Acount = zeros(10,1);
	data = load("testdata.txt");
	label = data(:,columns(data)); #retrieving the actual labels from the test data.

printf(" \n Confusion matrix for the Linear Svm-light\n");
fxd =[];
for d =0:9
	filename = strcat(num2str(d),"_linear_svm.result");
	data = dlmread(filename);	
	size(data);
	fxd = [fxd data];
end

fxd = fxd';
for d=1:10

	confusionMatrix=zeros(10,10);
	# getting the highest value of F(xd) to assign the label for that example and also creating the confusion matrix
	for i = 1:columns(fxd)	
	[maxvalue , maxindex] = max(fxd(:,i));
	Ylabel(i) = maxindex -1 ;
	Tlab = label;

	if( Ylabel(i) == Tlab(i))
		Acount(d,1) = Acount(d,1) +1;
		confusionMatrix(Tlab(i)+1,Ylabel(i)+1) = confusionMatrix(Tlab(i)+1,Ylabel(i)+1) + 1;
	else

		#printf("ylabel : %d , tlabel : %d , digit : %d\n",Ylabel(i),Tlab(i),d);
			confusionMatrix(Tlab(i)+1,Ylabel(i)+1) = confusionMatrix(Tlab(i)+1,Ylabel(i)+1) + 1;
	endif
	end	


end
confusionMatrix
Acount;
[maxi,ind] = max(Acount')

printf(" \n Confusion matrix for the polynomial kernel Svm-light\n");
fxd =[];
Acount = zeros(10,1);
for d =0:9
	filename = strcat(num2str(d),"_polynomial_svm.result");
	data = dlmread(filename);	
	size(data);
	fxd = [fxd data];
end

fxd = fxd';
for d=1:10

	confusionMatrix=zeros(10,10);
	# getting the highest value of F(xd) to assign the label for that example and also creating the confusion matrix
	for i = 1:columns(fxd)	
	[maxvalue , maxindex] = max(fxd(:,i));
	Ylabel(i) = maxindex -1 ;
	Tlab = label;

	if( Ylabel(i) == Tlab(i))
		Acount(d,1) = Acount(d,1) +1;
		confusionMatrix(Tlab(i)+1,Ylabel(i)+1) = confusionMatrix(Tlab(i)+1,Ylabel(i)+1) + 1;
	else

		#printf("ylabel : %d , tlabel : %d , digit : %d\n",Ylabel(i),Tlab(i),d);
			confusionMatrix(Tlab(i)+1,Ylabel(i)+1) = confusionMatrix(Tlab(i)+1,Ylabel(i)+1) + 1;
	endif
	end	


end
confusionMatrix
Acount;
[maxi,ind] = max(Acount')

printf(" \n Confusion matrix for the polynomial kernel Svm-light\n");
fxd =[];
Acount = zeros(10,1);
for d =0:9
	filename = strcat(num2str(d),"_svm_gaus.result");
	data = dlmread(filename);	
	size(data);
	fxd = [fxd data];
end

fxd = fxd';
for d=1:10

	confusionMatrix=zeros(10,10);
	# getting the highest value of F(xd) to assign the label for that example and also creating the confusion matrix
	for i = 1:columns(fxd)	
	[maxvalue , maxindex] = max(fxd(:,i));
	Ylabel(i) = maxindex -1 ;
	Tlab = label;

	if( Ylabel(i) == Tlab(i))
		Acount(d,1) = Acount(d,1) +1;
		confusionMatrix(Tlab(i)+1,Ylabel(i)+1) = confusionMatrix(Tlab(i)+1,Ylabel(i)+1) + 1;
	else

		#printf("ylabel : %d , tlabel : %d , digit : %d\n",Ylabel(i),Tlab(i),d);
			confusionMatrix(Tlab(i)+1,Ylabel(i)+1) = confusionMatrix(Tlab(i)+1,Ylabel(i)+1) + 1;
	endif
	end	


end
confusionMatrix
Acount;
[maxi,ind] = max(Acount')
end
