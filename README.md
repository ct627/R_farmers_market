# R Project (Farmers markets) 
This is an R project using farmers market dataset from the U.S. government’s open data.  
This repository contains data visualization and machine learning algorithms using RStudio (Version 1.2.5019).  

## Purpose  
1. Try to practice one visualization package in R (statebins).  
2. Try to practice Naive Bayes and RandomForest Classifier methods for Discrete Predictors.  
3. Use classifier methods to see is there any relation between factors and credit card or cash. Try to answer a question that will different categories of products in a farmers market affect the usage of credit card or cash?

## Data Source   
Data download from [Data.gov](https://catalog.data.gov/dataset/farmers-markets). Publisher by data.ct.gov.  
Other information please visit [Data.gov](https://www.data.gov).   

## Result (statebins plot)
<img width="1044" alt="fmplot" src="https://user-images.githubusercontent.com/67095395/86202801-24d88400-bb18-11ea-8c4f-e20337d7562f.png">  

## Result (Naive Bayes and RandomForest)  

### Naive Bayes

Confusion Matrix and Statistics. 
        
               Accuracy : 0.8213          
                 95% CI : (0.8046, 0.8371)
    No Information Rate : 0.6185          
    P-Value [Acc > NIR] : < 2.2e-16                                         
                  Kappa : 0.6275          
    
### RandomForest  

Confusion Matrix and Statistics. 
                                         
               Accuracy : 0.8681         
                 95% CI : (0.8533, 0.882)
    No Information Rate : 0.6021         
    P-Value [Acc > NIR] : <2e-16                                    
                  Kappa : 0.7257    
                  
## Code
Please see [code.R](https://github.com/ct627/R_farmers_market/blob/master/code.R) for details.  
