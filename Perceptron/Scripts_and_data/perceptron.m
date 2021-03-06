# this is the basic implementation of the perceptron Algorithm. used by other upper level code. (used in getMaxAccEpoch.m, runPerceptron.m)
function w = perceptron(filepath,ep)

data = load(filepath);
[m n] = size(data);
W = zeros(n,1);
X = [ones(m,1),data(:,[1:n-1])]; # adding the x0 = 1 to the data
T = data(:,n); #getting the true labels
Y = zeros(m,1); # storing the calculated labels.
Wp = W; # Wp is used to store W from previous epoch


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
			Wp= W;
		endif
	     end
	# check for convergence.
	if (W == Wp)
	printf("notconverged for epoch : %d \n", epoch);
	else
	printf("converged for epoch : %d \n", epoch);
	break;
	endif
end

#printf("\nAfter epoch %d value for weight vector ",epoch);
#W
#printf(" Yi = Calculated label , Ti = True label for each example\n");
#printf(" Yi (column 1) and Ti (column 2) ");
#comparison = [Y T]
#printf("Normalized Weight vector  ");
w = W/norm(W);

end
