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
training data set:
- addition
- deletion
- transformation

Unsupevised data processing: the outcome variable is not considered by the preprocessing techniques.

Feature selection: the model will only include predictors that help maximize accuracy.

* Data transformations for individual predictors.
- the average predictor value is subrtacted from all the values
- centering: the predictor has a zero mean
- scaling: each value of the predictor variable is divided by its standard deviation.

* Transformations to resolve skewness.
- positive - right skewness
- negative - left skewness
Replacing the data w the log, square root, or inverse may help to remove the skew.

* Box and Cox transformation.

