%
% Linear Regression model selection with regularization and  validation set
% comparing the erms for Train and valid for lg lamda = [-50,0] and plotting erms of train vs erms of valid.

%loading your train data and storing in vectors.
data=load('train.dat');
X = data(:,1);
T = data(:,2);

% Loading validation data into the Vectors and appending to the original vector.
vdata =load('valid.dat');
X = [vdata(:,1);X];
T = [vdata(:,2);T];

% these vectors are used to store the erms in training and testing , later to plot the erms vs M graph.
erms = zeros(1,10);
terms = zeros(1,10);

%loading your test data and storing in Vectors.
tdata = load('test.dat');
X2=tdata(:,1);
T2=tdata(:,2);

i =1;

%Model M = 0
lam = -20;
In = eye(1);
In = exp(lam)*In;
%In
P = [X.^0];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);
i = i+1;


%Model M = 1
lam = -20;
In = eye(2);
In = exp(lam)*In;
%In
P = [X.^0,X.^1];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);
i = i+1;


%Model M = 2
lam = -20;
In = eye(3);
In = exp(lam)*In;
%In
P = [X.^0,X.^1,X.^2];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);
i = i+1;

%Model M = 3
lam = -20;
In = eye(4);
In = exp(lam)*In;
%In
P = [X.^0,X.^1,X.^2,X.^3];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);
i = i+1;


%Model M = 4
lam = -20;
In = eye(5);
In = exp(lam)*In;
%In
P = [X.^0,X.^1,X.^2,X.^3,X.^4];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);
i = i+1;


%Model M = 5
lam = -20;
In = eye(6);
In = exp(lam)*In;
%In
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);
i = i+1;


%Model M = 6
lam = -20;
In = eye(7);
In = exp(lam)*In;
%In
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5,X.^6];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5,X2.^6];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);
i = i+1;


%Model M = 7
lam = -20;
In = eye(8);
In = exp(lam)*In;
%In
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5,X.^6,X.^7];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5,X2.^6,X2.^7];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);
i = i+1;

%Model M = 8
lam = -20;
In = eye(9);
In = exp(lam)*In;
%In
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5,X.^6,X.^7,X.^8];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5,X2.^6,X2.^7,X2.^8];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);
i = i+1;

%Model M = 9
lam = -20;
In = eye(10);
In = exp(lam)*In;
%In
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5,X.^6,X.^7,X.^8,X.^9];
W = pinv(In+(P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5,X2.^6,X2.^7,X2.^8,X2.^9];
%w2 = pinv(In+(C'*C)*C'*T2;
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,i) = sqrt((2*s1)/20);
terms(1,i) = sqrt((2*s2)/10);

i = i+1;
erms(1,10)
terms(1,10)


scale = 0:9;
plot(scale,erms,"-o","linewidth", 2,scale,terms,"-o","linewidth", 2);
title ('plot d3b : Linear Regression with Regularization for loglamda = -20 and M = [0,9]');
h = legend ({'Train+Validation'}, 'Test');
legend (h, 'location', 'northeastoutside');
set (h, 'fontsize', 10);
xlabel(' Model M ');
ylabel(' ERMS ');

