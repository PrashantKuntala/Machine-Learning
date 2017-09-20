# Linear Regression

An experimental evaluation of the linear regression model, with and without regularization.

> programming language : Octave

## Scripts and their function

**Plotdataset.m**
> plots the data in dataset.dat

**Plottrain.m** 
> plots the data in train.dat

**Plottest.m**
> plots the data in test.dat

**Plotvalid.m**
> plots the data in valid.dat

**linearWReg.m**
> solves the linear regression without regularization, plots the erms vs Model for train and test data. Used to select the linear regression model M = [0-9].

**linearWRegV.m**
> solves the linear regression without regularization, considers adding the validation set to train, plots erms vs model for train+validation and test data.

**linearRegL.m**
> solves the linear Regression with regularization, choosing Model = 9 for log lamda = [-50,0] and plots the values.

**linearRegL2.m**
> solves the linear Regression with regularization, choosing Model =9 and lg lamda = -20. plots the graph for log lambda = -20 over all the M = [0,9]

**linearRegLV.m**
> solves the linear Regression with regularization fixing M =9 and lg lamda = -20 plots the graph for log lambda = -20 over all the M = [0,9]. Consideres the validataion data to train.

## Usage 

in the octave prompt , type the script name with out the extension.

```
example: 

$> octave

>> Plotdataset
```
