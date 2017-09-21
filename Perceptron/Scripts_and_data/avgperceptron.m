
function w = avgperceptron(filepath,ep)
#filepath = input("enter the path to your data file\n","S");
data = load(filepath);
[m n] = size(data);
W = zeros(n,1);
X = [ones(m,1),data(:,[1:n-1])];
T = data(:,n);
Y = zeros(m,1);
Wbar = W; # Wb is used to sum up each W in each epoch
count =1;

# sigmoid function
function g = sigmoid(z)
g = 1 ./ (1 + e.^-z);
	if(g >= 0.5)
		g = 1;
	else
		g = -1;
	endif
end


for epoch = 1:ep

	for i = 1:m
	 	Y(i,1) = sigmoid(X(i,:)*W);		
	    	
		if(Y(i,1) != T(i,1))
			W = W + (T(i,1)*X(i,:))';
			Wp = W;
		endif
		Wbar = Wbar + W;
		count = count + 1;		
	     end 	
	# check for convergence.
	if (W == Wp)
	#printf("notconverged for epoch : %d \n", epoch);
	else
	printf("converged for epoch : %d \n", epoch);
	break;
	endif
	
end
Wbar = Wbar/count; # calculate avg parameters after each epoch
W = Wbar; # set W to Wbar which is the average of all
w = W/norm(W);
#printf("\nAfter epoch %d value for  ",epoch);
#W
#printf(" Yi = Calculated label , Ti = True label for each example\n");
#printf(" Yi (column 1) and Ti (column 2) "); 
#comparison = [Y T]
end
