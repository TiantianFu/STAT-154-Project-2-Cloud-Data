# STAT-154-Project-2-Cloud-Data
README:

The purpose of the code is to explore and model cloud detection in the polar regions based on eight variables and they are NDAI, SD, CORR, Radiance angel DF, CF, BF, AF, and AN. 
The code can be divided into four parts: Data Collection and Exploration, data Preparation, Data Modeling, Diagnostics.

For the first part, we explored the dataset by summarizing the data, and we tried to find pair wise relationships between the features by using box plots. Last but not least, we tried to find the relationship between the expert labels with the individual features by using scatterplots. 

For the second part, We prepared the data to train our model for the third part after getting familiar with our dataset. Firstly, we use two functions, split1() and split2(), indicating two different methods(divide grids based on XY locations, randomly split) to split the entire data into three sets: training, validation and test. And then we found the baseline by using a trivial classifier. In split1 method, we also create a function split_grids() to split the grids with different numbers on the X and Y axis. Most importantly, we used the correlation plot to find three best features among eight features, which set a foundation for our melding in part three. We also wrote a generic cross validation function, which can quickly calculate the loss rate for different modeling methods in part three. 

For the third part, we used the generic function we wrote in part two and ROC curves to better identify which classification model is the best.

For the last part, we deeply analyzed the misclassification points in each image after using our ???best??? classification method modeling and we also used convergence curve to find a better classifier which is random forest to fit our dataset. We use diag_plots() with the model, model name, training set, validation se and test set as different arguments to get the diagnostic plots in 4a, and similarly, use mis_plot() to get the misclassification distributions on the plots with different images.