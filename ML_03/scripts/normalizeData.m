# 
# Author : Prashant kuntala
# date   : 10/31/16
#
#last modified : 11/2/16
# After the feature selection ( feature ranking ), Normalizing the training and validation data.


# loading the ranked features file for Pcc , S2N and Ttest separately.
data = load("features.dat");
trainlabels = load("dextertrainlabels.dat");

vdata = load("validfeatures.dat");
validlabels = load("dextervalidlabels.dat");


rankingFile = load("ttestRanking.dat"); 
size(rankingFile)
rankingFile = flipud(rankingFile);
size(rankingFile)

temp = []
temp2 = []

#shuffling the feature vectors based on Ranking file
for i=1:20000
temp = [temp data(:,rankingFile(i,:))];
temp2 = [temp2 vdata(:,rankingFile(i,:))];
end
size(temp)
size(data)
data = temp;
vdata = temp2;

#debugging to check whether the data is made correctly.
#size(temp);
#pccRanking(:,1)
#my = [temp(:,1) data(:,pccRanking(:,1)+1)]


# changed normalization from columns to rows.

function n = normalizeD(ndata)

	for r = 1:rows(ndata)
		nrm = norm(ndata(r,:));
		for c = 1:columns(ndata)
			if( nrm == 0)
				ndata(r,c) = 0;
			else
				ndata(r,c) = ndata(r,c)/nrm;
			endif
		end	
	end
n = ndata;
end




# creating a directory to hold the feature files.
mkdir Nfeatures;

#vdata = normalizeD(vdata);
#vdata = [vdata validlabels];
#dlmwrite(strcat(pwd,"/Nfeatures/validdata.dat"),vdata)

# Loop for the set of all Top K features from the ranked file for Normalization of features
for N=[ 1 5 10 20 50 100 200 300 400 500 600 700 800 900 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 12000 14000 16000 18000 20000]

	ndata = data(:,[1:N]);
	n1data = vdata(:,[1:N]);
	ndata = normalizeD(ndata);
	n1data = normalizeD(n1data);
	ndata = [ndata trainlabels];
	n1data = [n1data validlabels];
	dlmwrite(strcat(pwd,"/Nfeatures/N",num2str(N),".txt"),ndata);
	dlmwrite(strcat(pwd,"/Nfeatures/N",num2str(N),"valid.txt"),n1data);
end

printf("Finished creating normalized files\n");

# use changeDataFormat.py to generate svm-light format files for the above Nfeature files.
