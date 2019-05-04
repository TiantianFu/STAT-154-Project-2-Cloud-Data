# STAT-154-Project-2-Cloud-Data
README:

The purpose of the code is to explore and model cloud detection in the polar regions based on eight variables and they are NDAI, SD, CORR, Radiance angel DF, CF, BF, AF, and AN. 
The code can be divided into four parts: Data Collection and Exploration, data Preparation, Data Modeling, Diagnostics.

For the first part, we explored the dataset by summarizing the data, and we tried to find pair wise relationships between the features by using box plots. Last but not least, we tried to find the relationship between the expert labels with the individual features by using scatterplots. 

For the second part, We prepared the data to train our model for the third part after getting familiar with our dataset. Firstly, we split the entire data using two different methods into three sets: training, validation and test. And then we found the baseline by using a trivial classifier. Most importantly, we used the correlation plot to find three best features among eight features, which set a foundation for our melding in part three. Last but not least, we wrote a generic cross validation function, which can quickly calculate the loss rate for different modeling methods in part three. 

For the third part, we used the generic function we wrote in part two and ROC curves to better identify which classification model is the best.

For the last part, we deeply analyzed the misclassification points in each image after using our ???best??? classification method modeling and we also used convergence curve to find a better classifier which is random forest to fit our dataset. 