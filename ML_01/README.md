# Linear Regression

> Date : 19th September, 2016

An experimental evaluation of the linear regression model, with and without regularization.

> programming language : Octave

## Scripts and their function

- Plotdataset.m  : plots the data in dataset.dat
- Plottrain.m : plots the data in train.dat
- Plottest.m : plots the data in test.dat
- Plotvalid.m : plots the data in valid.dat

- linearReg.m
> solves the linear regression without regularization, plots the erms for train and test against Model. Used to select the linear regression model [0-9].

- prash5d2.m		-- solves the linear regression without regularization and adding the validation set to train,
		 	   using E(w) for model M = [0,9] and plots erms for train+validation and test against Model.
- prash5d3.m		-- solves the linear Regression with regularization fixing M = 9 for lg lamda = [-50,0] and plots the values.
- prash5d3a.m		-- solves the linear Regression with regularization fixing M =9 and lg lamda = -20 prints erms for train and test
			   and also plots the graph for log lambda = -20 over all the M = [0,9]
- prash5d3b.m		-- solves the linear Regression with regularization fixing M =9 and lg lamda = -20 prints erms for train+validation 
			   and test.plots the graph for log lambda = -20 over all the M = [0,9]

## Usage 

in the octave prompt , type the script name with out the extension.

```
example: 

$> octave

>> prashPlotdataset
```
