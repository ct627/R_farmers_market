# R Code 

## Load packages and import data set.
```
pacman::p_load(tidyverse,readr,dplyr,ggplot2,plotly,dygraphs,statebins,plyr)
pacman::p_load(rpart,randomForest,GGally,e1071,gmodels,caret)
Export <- read_csv("/Documents/Export.csv")
```

## Create a graph first and see the farmers market distributed in the USA.
```
farmsmarket <- Export[-c(1,3:7,12:20,23)]
farmbin <- farmsmarket %>% select(State) %>% na.omit()
farmbin <- farmbin %>% group_by(State) %>% arrange(State) %>% count() farmbin <- farmbin %>% mutate(value=freq/8796)
farmbin <- farmbin %>% select(State,value)
statebins_continuous
(
state_data = farmbin, state_col = "State", text_color = "white", value_col = "value",
brewer_pal="PuBu", font_size = 3,
legend_title="Percentage",
legend_position = "bottom",
plot_title ="Farmers Market location Rate by State (percent)", title_position = "top"
)
```

## Easily search farmers market located in select state.
```
farmsmarket1 <- farmsmarket %>% na.omit()
farmsmarket1 %>% filter(State =="New York") %>% select(MarketName,street)
```

## Naive Bayes Classifier
### Select product category variables such as Organic, Baked goods, Cheese and so on 
### to see the two groups which are Y and N in credit variable stands for the market can use credit card or not.
```
fmNB <- farmsmarket %>% select
(
MarketName,State,Credit,Organic,Bakedgoods,Cheese,Crafts,Flowers,Eggs,Seafood,Herbs,Vegetables,Honey,
Jams,Maple,Meat,Nursery,Nuts,Plants,Poultry,Prepared,Soap,Trees,Wine,Coffee,Beans,Fruits,Grains,Juices,Mushrooms,PetFood,Tofu,WildHarvested
)

### Split data
n <- nrow(fmNB)
idxtrain <- sample.int(n, size = round(0.25 * n))
fmNB_train <- fmNB[-idxtrain, ]
train_label = as.factor(fmNB_train$Credit)
x = fmNB_train[,-c(1:3)]
nrow(fmNB_train)
nrow(x)
fmNB_test <- fmNB[idxtrain, -c(1:2)]
test_label = as.factor(fmNB_test$Credit)
fmNB_test <- fmNB_test[,-1]
nrow(fmNB_test)

### Check dimensions of the split
prop.table(table(fmNB$Credit)) * 100
prop.table(table(fmNB_train$Credit)) * 100
prop.table(table(test_label)) * 100

### builing model
model = naiveBayes(x,train_label)
model

### Predict testing set
test_pred <- predict(model, fmNB_test)
head(test_pred)
head(test_label)

### Model Accuracy
CrossTable(test_pred, test_label,
prop.chisq = FALSE, prop.t = FALSE, prop.r = FALSE, dnn = c('predicted', 'actual'))
confusionMatrix(test_pred, test_label)
```

## Random Forest Classification
```
fmrf <- farmsmarket %>% select(Credit,Bakedgoods,Cheese,Crafts,Flowers,Eggs,Seafood,Herbs,Vegetables,Honey,Jams,Maple,Meat,Nursery,Nuts,
                               Plants,Poultry,Prepared,Soap,Trees,Wine,Coffee,Beans,Fruits,Grains,Juices,Mushrooms,PetFood,Tofu,WildHarvested)
                    %>% mutate_if(is.character,as.factor)
str(fmrf)
idxtrain <- sample.int(n, size = round(0.25 * n))
fmrf_train <- fmrf[-idxtrain, ]
fmrf_test <- fmrf[idxtrain, ]

#build model
rf <- randomForest(Credit ~ ., data = fmrf_train)
credit_pred <- predict(rf, fmrf_test)
confusionMatrix(data=credit_pred, fmrf_test$Credit)
```

