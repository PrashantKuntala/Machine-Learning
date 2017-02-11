% this script does the following plots your valid.dat

%loading your train data and storing in vectors.
data=load('valid.dat');
X = data(:,1);
T = data(:,2);

%plotting your train.dat
plot(X,T,"--*k","markersize", 10);
title ('Plot for the valid.dat');
h = legend ('Validation data');
legend (h, 'location', 'northeastoutside');
set (h, 'fontsize', 10);
xlabel('X vector');
ylabel('T Vector');
