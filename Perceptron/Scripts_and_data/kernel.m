# polynomial kernel function
function b = kernel(T,X,d)
k = (X*X').^d;
b=k.*T';
end

