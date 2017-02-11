
# author : prashant kuntala
# date   : Nov 1st,2016

# last modified : NOV 1st,16

	Acount = zeros(29,1);
	label = load("dextervalidlabels.dat"); #retrieving the actual labels from the test data.
	count = 0;
	i = 0;
for N=[ 1 5 10 20 50 100 200 300 400 500 600 700 800 900 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 12000 14000 16000 18000 20000]
	i = i +1 ;
	data = load(strcat(pwd,"/Nfeatures/svmfeatures/results/N",num2str(N),"_svml_linear.result"));
	for r=1:rows(data)
		if(data(r) >= 0)
			value = 1;
			if(value == label(r))
				count = count + 1;
			endif
		else
			value = -1;
			if(value == label(r))
				count = count + 1;
			endif
		endif
	end
	Acount(i) = (count/300) * 100;
	count = 0;
end



#x=[ 1 5 10 20 50 100 200 300 400 500 600 700 800 900 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 12000 14000 16000 18000 20000]
x = linspace(1,20000,29);
Acount
[value,index] = max(Acount)

x(:,index)
ylim([0 100]);
plot(x,Acount,"--o");
axis([1 20000 0 100]);
xlabel(" No . of Features  (N)");
ylabel(" Accuracy ");
print -dpng Pearson_graph.png
#pause
