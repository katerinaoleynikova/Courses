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



