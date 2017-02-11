%
% Linear Regression model selection with regularization.
% comparing the erms for Train and valid for lg lamda = [-50,0] in steps of five and plotting erms of train vs erms of valid.

%loading your train data and storing in vectors.
data=load('train.dat');
X = data(:,1);
T = data(:,2);


% these vectors are used to store the erms in training and testing , later to plot the erms vs log lamda graph.
erms = zeros(1,10);
terms = zeros(1,10);

%loading your test data and storing in Vectors.
tdata = load('valid.dat');
X2=tdata(:,1);
T2=tdata(:,2);

%Model M = 9
i =1;
for lam = -50:5:0
In = eye(10);
In = exp(lam)*In;
%In
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5,X.^6,X.^7,X.^8,X.^9];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5,X2.^6,X2.^7,X2.^8,X2.^9];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*10);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/10);
terms(1,i) = sqrt((2*s2)/10);

i = i+1;
end

erms
terms

%plotting the erms and validation erms against the loglamda.
scale = -50:5:0;
plot(scale,erms,"-o","linewidth", 2,scale,terms,"-o","linewidth", 2);
title ('plot d3 : Linear Regression with Regularization for M = 9');
h = legend ({'Train'}, 'Validation');
legend (h, 'location', 'northeastoutside');
set (h, 'fontsize', 10);
xlabel(' log lamda ');
ylabel(' ERMS ');

%prints the minimum erms value so that we can know the loglamda.
x = -50:5:0
my = [x;terms;erms]
my'
min(terms)
min(erms)

