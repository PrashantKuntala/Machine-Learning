# have a fucntion called display that displays the final W comparision between calculated Y and original T labels.

function w = gausperceptron(filepath,ep,sigma)
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
#end
#K=K.*T;
#end

TK = Tkernel(X,X,sigma); # polynomial kernel function.


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


w =alpha;
end
