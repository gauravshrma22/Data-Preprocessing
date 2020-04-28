#Data preprocessing

#Importing the libraries
Dataset = read.csv("Data.csv")

#Missing Data
Dataset$Age = ifelse(is.na(Dataset$Age),
                     ave(Dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     Dataset$Age)

Dataset$Salary = ifelse(is.na(Dataset$Salary),
                     ave(Dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     Dataset$Salary)

#Encoding the Categorical Data
Dataset$Country = factor(Dataset$Country,
                         levels = c('France','Spain','Germany'),
                         labels = c(1,2,3)
                         )
Dataset$Purchased = factor(Dataset$Purchased,
                         levels = c('Yes','No'),
                         labels = c(1,0)
                         )

#Splitting the Dataset into the training set and test set
#install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(Dataset$Purchased, SplitRatio = 0.8)
training_set = subset(Dataset, split==TRUE)
test_set = subset(Dataset, split==FALSE)

#Feature Scaling
training_set[ ,2:3] = scale(training_set[ ,2:3])
test_set[,2:3] = scale(test_set[,2:3])
