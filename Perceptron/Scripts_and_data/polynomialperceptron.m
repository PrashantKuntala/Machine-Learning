# have a fucntion called display that displays the final W comparision between calculated Y and original T labels.

function w = polynomialperceptron(filepath,ep,d)
#filepath = input("enter the path to your data file\n","S");
data = load(filepath);
[m n] = size(data);
W = zeros(n,1);
X = [ones(m,1),data(:,[1:n-1])];
T = data(:,n);
Y = zeros(m,1);
alpha = zeros(m,1);
alphachanged =0;

# sigmoid function
function g = sigmoid(z)
g = 1 ./ (1 + e.^-z);
	if(g >= 0.5)
		g = 1;
	else
		g = -1;
	endif
end

# polynomial kernel function
function b = Tkernel(T,X,d)
k = (1+X*X').^d;
b=k;
end


TK = Tkernel(T,X,d); # polynomial kernel function.


for epoch = 1:ep
	alphachanged =1;	
	for i = 1:m
		value = TK(i,:) *(T.* alpha);
		
		#printf("value of value : %d \n",value);
	 	Y(i,1) = sigmoid(value);		
	    	#printf("Value of yi  at epoch %d is : %d \n", i,Y(i,1)); 
		if(Y(i,1) != T(i,1))
			alpha(i) = alpha(i) + 1;
			alphachanged =0;
			#printf("alpha changed ------------------%d\n",alpha);
		endif
				
	     end 	
	# check for convergence.
	if (alphachanged != 1)
	#printf("notconverged for epoch : %d \n", epoch);
	else
	printf("converged for epoch : %d \n", epoch);
	break;
	endif
	
end


w =alpha/norm(alpha);
end
