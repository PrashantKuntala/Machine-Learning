
% this script  plots your dataset.dat



%loading your train data and storing in vectors.
data=load('./data/dataset.dat');
X = data(:,1);
T = data(:,2);

%plotting your train.dat
plot(X,T,"--*k","markersize", 10);
title ('Plot for the dataset.dat');
h = legend ('dataset');
legend (h, 'location', 'northeastoutside');
set (h, 'fontsize', 10);
xlabel('X vector');
ylabel('T Vector');
