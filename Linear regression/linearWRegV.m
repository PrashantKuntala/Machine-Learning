%
% Linear Regression model selection without regularization and INCLUDING validation set to train data.

% Plotting the train erms and test erms for M = [0,9]

%loading your train data and storing in vectors.
data=load('./data/train.dat');
X = data(:,1);
T = data(:,2);

% these vectors are used to store the erms of training and testing , later to plot the erms vs M graph.
erms = zeros(1,10);
terms = zeros(1,10);

% Loading validation data into the Vectors and appending to the original vector.
vdata =load('./data/valid.dat');
X = [X;vdata(:,1)];
T = [T;vdata(:,2)];
X

%loading your test data and storing in Vectors.
tdata = load('./data/test.dat');
X2=tdata(:,1);
T2=tdata(:,2);

%Model M = 0
P = [X.^0];
W = pinv((P'*P)) * P' * T;
W
%P
C = [X2.^0];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,1) = sqrt((2*s1)/20);
terms(1,1) = sqrt((2*s2)/10);


%Model M = 1
P = [X.^0,X.^1];
W = pinv((P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,2) = sqrt((2*s1)/20);
terms(1,2) = sqrt((2*s2)/10);


%Model M=2
P = [X.^0,X.^1,X.^2];
W = pinv((P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,3) = sqrt((2*s1)/20);
terms(1,3) = sqrt((2*s2)/10);

%Model M=3
P = [X.^0,X.^1,X.^2,X.^3];
P
W = pinv((P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,4) = sqrt((2*s1)/20);
terms(1,4) = sqrt((2*s2)/10);

%Model M=4
P = [X.^0,X.^1,X.^2,X.^3,X.^4];
W = pinv((P'*P)) * P' * T;
%P
W
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,5) = sqrt((2*s1)/20);
terms(1,5) = sqrt((2*s2)/10);


%Model M=5
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5];
W = pinv((P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,6) = sqrt((2*s1)/20);
terms(1,6) = sqrt((2*s2)/10);

%Model M=6
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5,X.^6];
W = pinv((P'*P)) * P' * T;
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5,X2.^6];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,7) = sqrt((2*s1)/20);
terms(1,7) = sqrt((2*s2)/10);

%Model M=7
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5,X.^6,X.^7];
W = pinv((P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5,X2.^6,X2.^7];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,8) = sqrt((2*s1)/20);
terms(1,8) = sqrt((2*s2)/10);

%Model M=8
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5,X.^6,X.^7,X.^8];
W = pinv((P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5,X2.^6,X2.^7,X2.^8];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,9) = sqrt((2*s1)/20);
terms(1,9) = sqrt((2*s2)/10);

%Model M=9
P = [X.^0,X.^1,X.^2,X.^3,X.^4,X.^5,X.^6,X.^7,X.^8,X.^9];
W = pinv((P'*P)) * P' * T;
W
%P
C = [X2.^0,X2.^1,X2.^2,X2.^3,X2.^4,X2.^5,X2.^6,X2.^7,X2.^8,X2.^9];
s1 = (sum(((P*W).-T).^2))/(2*20);
s2 = (sum(((C*W).-T2).^2))/(2*10);
erms(1,10) = sqrt((2*s1)/20);
terms(1,10) = sqrt((2*s2)/10);

%printing the final erms for train and test sets.
erms(1,10)
terms(1,10)


scale = 0:9;
%scale1 = 0:19;
plot(scale,erms,"linewidth", 2,scale,terms,"linewidth", 2);
title ('plot d2 : Linear Regression without Regularization along with validation data for M [0,9]');
h = legend ({'Train + validation'}, 'Test');
legend (h, 'location', 'northeastoutside');
set (h, 'fontsize', 10);
xlabel(' Model M ');
ylabel(' ERMS ');
