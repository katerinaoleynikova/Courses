Modern Methods of Data Analysis.
ML and data analysis in bioinformatics. Building predictive models. Advanced statistics.



Class 1 was dedicated to the problems that bionformatics may solve. Some basic def. applied in biology disciplines, etc. (See notes)


Class 2. Data Pre-processing.
Unsupervised data processing. Techniques of addition, deletion, transformation of training data set. Reduction of data skewness or outliers. Feature engineering.
Feature extraction. Surrogate variables as combinations of multiple predictors. Dummy variables.

Case Study:

Mice protein expression (Expression levels of 77 proteins measured in the celebral cortex).


It is needed to remember that data preparation can make or break a model's predictive ability. How the predictors enter the model is important.

Feature eng. is how the predictors are encoded -> can have significant impact on model performance.

*training data set:*
addition,
deletion,
transformation.

Unsupevised data processing: the outcome variable is not considered by the preprocessing techniques.

Feature selection: the model will only include predictors that help maximize accuracy.

*Data transformations for individual predictors.*
the average predictor value is subrtacted from all the values;
centering: the predictor has a zero mean;
scaling: each value of the predictor variable is divided by its standard deviation.

*Transformations to resolve skewness.*
positive - right skewness;
negative - left skewness.

Replacing the data w the log, square root, or inverse may help to remove the skew.

*Box and Cox transformation.*

Data transformations for multiple predictors.
Transformations to resolve outliers - brings outliers towards the majority of the data.

*Data reduction and feature extraction.*
reduce the data by generating a smaller set of predictors that seek to capture the majority of the inf. in the original variables;
the new predictors are functions of the original predictors;
all the original predictors are still needed to create the surrogate variables;
this class of methods is often called *signal extraction or feature extraction techniques*.

*Principal component analysis.*
Definition: PCA is orthogonal transformation to convert a set of observations of possibly correlated variables into a set of values of linearly uncorrelated variables called *principal components*.
This method seeks to find linear combinations of the predictors, known as principal components (PCs), which capture the most possible variance.
PCj = (aj1 * Predictor1) + (aj2 * Predictor2) + ... + (ajP * Predictor P)
https://setosa.io/ev/principal-component-analysis/ - get to know more about PCA.
PCA:
creates components that are uncorrelated;
seeks linear combinations of predictors that maximize variability;
unsupervised technique -> PCA is blind to the response;
scree plot;
for most data sets predictors are on dif. scales.

Scree plot: the scree plot helps you to determine the optimal num. of components.


Seminar 2. Case study. Mice protein expression.

Expression level of 77 proteins measured in the celebral cortex of 8 classes of control and Down syndrome mice exposed to context fear conditioning, a task used to assess associative learning.

Kaggle Competition: (https://www.kaggle.com/ruslankl/mice-protein-expression)

The eight classes of mice are described based on features such as genotype, behavior and treatment. According to genotype, mice can be control or trisomic. According to behavior, some mice have been stimulated to learn (context-shock) and others have not (shock-context) and in order to assess the effect of the drug memantine in recovering the ability to learn in trisomic mice, some mice have been injected with the drug and others have not.

Classes:
c-CS-s: control mice, stimulated to learn, injected with saline (9 mice);
c-CS-m: control mice, stimulated to learn, injected with memantine (10 mice);
c-SC-s: control mice, not stimulated to learn, injected with saline (9 mice);
c-SC-m: control mice, not stimulated to learn, injected with memantine (10 mice);
t-CS-s: trisomy mice, stimulated to learn, injected with saline (7 mice);
t-CS-m: trisomy mice, stimulated to learn, injected with memantine (9 mice);
t-SC-s: trisomy mice, not stimulated to learn, injected with saline (9 mice);
t-SC-m: trisomy mice, not stimulated to learn, injected with memantine (9 mice).

Class 3-4. Linear regression models.  
Linear regression. Measuring performance in regression models.  
Case study: Solubility data.  
  
*Root Mean Squared Error (RMSE)*  
RMSE = sqrt((1/n) x sum_(i=1)^n(y_i - y-hat_i)^2)  
Meaning: how far (on average) the residuals are from zero.  
It is smth like as the average distance between the observed values and the model predictions.  
/A residual - the difference between the observed y-value (from scatter plot) and the predicted y-value (from regression equation line).  
It is the vertical distance from the actual plotted point to the point on the regression line./

*Coefficient of determination R^2*  
Usually R is a correlation coefficient (either Pearson or Spearman's rank correlation).  
R^2 means proportion of the information in the data that is explained by the model.  
/For instance, R^2 = 0.75 means that the model can explain 75% of the variation in the outcome./  

*Ordinary Linear Regression*  
- finds the plane (hyperplane, to be exact) that minimizes *the sum-of-squared errors (SSE)* between the observed and predicted response.  
- sum-of-squared errors can be found by the formula:  
SSE = sum_(i=1)^n(y_i - y-hat_i)^2.  

*Regression model in matrix form*  
y = X x beta + epsilon  
The linear model w/ several explanatory variables is given by the equation:  
y_i = beta_1 + beta_2 x x_(2i) + beta_3 x x_(3i) + .. + beta_k x x_(ki) + epsilon_i (i = 1,..,n).  
It is convenient to express the model in matrix form:  
      y_1          1   x_21  .. x_(k1)            beta_1                epsilon_1  
y = ( .. ), X = ( ..    ..   ..  ..   ), beta = (   ..   ), epsilon = (    ..     ), where  
      y_n          1  x_(2n) .. x_(kn)            beta_k                epsilon_n  

n x k - matrix X,  
j (j = 1,..,k) - variable number in columns,  
i (i = 1,..,n) - observation number in rows.  

*Beta^ (Beta-hat) equation*  
Mathematically, the optimal plane can be found as it follows:  
(X^(T)X)^(-1) x X^(T)y,  
where X - the matrix,  
y - the response vector,  
X^T - transpose of matrix,  
X^(-1) - inverse matrix.  

*Collinearity between predictors affects linear regression.*
- predictors may be functions of two or more of the other predictors - it means collinearity.
- the variance inflation factor (VIF) can be used (Myers 1994).
/VIF is a measure of the amount of multicollinearity in a set of multiple regression variables. Mathematically, the VIF for a regression model is equal to
the ratio of the overall model variance to the variance of a model that includes only that single independent variable./
- this statistic is computed for each predictor and a function of the correlation between the selected predictor and all of the other predictors.

*Drawbacks of linear regression.*
- relations between predictors and outcome have curvatures -> requires nonlinearity.
- observations that are far from the trend of the majority of the data will have exponentially large residuals -> robust regression has been developed.
- there are no tuning parameters for multiple linear regression.

*Robust regression*
To deal w/ the presence of outliers in a dataset, we can use a family of robust regression models.
In such type of regression we seek to minimize the effect of outliers on the regression equations.
It is particularly resourceful when there are no compelling reasons to exclude outliers in a data.

**Penalized regression models / Shrinkage methods**
Penalized regression methods are also known as shrinkage or regularization methods for linear models cause a penalty causes the regression coef-s to shrink toward zero.
In effect, these methods shrink the estimates towards zero as the lambda becomes large.
It is worth to note that penalty can be optimized (it is a tuning parameter).
*Ridge regression*
Ridge regression (Hoerl 1970) adds a penalty on the sum of the squared regression parameters:
SSE_(L2) = sum_(i=1)^n(y_i - y-hat_i)^2 + lambda x sum_(j=1)^P(beta_j)^2,
where (beta_j)^2 - a coefficient that is weight of each predictor in linear model.
Ridge regression properties:
- the "L2" signifies that this is a second-order penalty -> Ridge regression penalizes sum of squared coefficients (L2 penalty).
- ridge regression is also known as Tikhonov regularization.
- ridge regression is a model tuning method that is used to analyze any data that suffers from multicollinearity.

*Least absolute shrinkage and selection operator model (LASSO)*
LASSO regression penalizes the sum of absolute values of the coef-s (L1 penalty):
SSE_(L1) = sum_(i=1)^n(y_i - y-hat_i)^2 + lambda x sum_(j=1)^P|beta_j|.
The key dif. between LASSO regression and Ridge regression is the penalty term (L1 and L2).
LASSO tends to do well if there is a small number of significant parameters and the others are close to zero {when only a few predictors actually influence the response}.

*Elastic Net*

