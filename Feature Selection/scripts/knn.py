from __future__ import division
import os
import numpy as np
from sklearn.neighbors import KNeighborsClassifier
import matplotlib.pyplot as plt
from sklearn.neighbors import DistanceMetric

N=[5, 10, 20, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 12000, 14000, 16000, 18000, 20000]

#stores accuracy for each N
accuracy = []

for n in range(0,len(N)):
	filename = os.getcwd()+"/Nfeatures/"+"N"+str(N[n])+".txt"
	print filename
	X = np.genfromtxt(filename, delimiter = ',')
	X = np.matrix(X[:,[range(0,N[n])]])
	print "dimensions of your feature vector : " + str(X.shape)
	

	vfilename = os.getcwd()+"/Nfeatures/"+"N"+str(N[n])+"valid.txt"
	vdata = np.genfromtxt(vfilename, delimiter = ',')
	vdata = np.matrix(vdata[:,[range(0,N[n])]])
	validlabels = np.genfromtxt("dextervalidlabels.dat",delimiter = ',')
	validlabels = np.array(validlabels).astype(int)
	#vl = list(validlabels.T)
	trainlabels = np.matrix(np.genfromtxt("dextertrainlabels.dat",delimiter = ','))
	y = np.array(trainlabels.T).astype(int)

	print y.shape
	dist = DistanceMetric.get_metric('euclidean')
	neigh = KNeighborsClassifier(n_neighbors=10,p=2)
	neigh.fit(X, y.ravel()) 


	predicted = neigh.predict(vdata)
	#print predicted
	#print type(predicted)
	#print validlabels

	count = 0
	for i in range(0,300):
		if(validlabels[i] == predicted[i]):
			#print validlabels[i] + predicted[i]		
			count = count + 1
			#print count	

	#print count



	accuracy.append((count/300)*100)
#print ans
print accuracy
print np.argsort(accuracy)
print max(accuracy)

xaxis = np.linspace(0,20000,num=28)
plt.plot(xaxis, accuracy,'r--o')
axes = plt.gca()
axes.set_ylim([0,100])
plt.ylabel("Accuracy")
plt.xlabel("No . of Features (N)")

plt.show()


#print acc
#print(neigh.predict_proba([[0.9]]))

