#Set path
setwd("C:\\Users\\Utkarsh Prajapati\\Downloads\\Compressed\\Machine Learning A-Z Template Folder\\Part 1 - Data Preprocessing")

#Import csv file
data <- read.csv("data.csv")
#View(data)

#Take only independent variables 
independent <- data[1:3]
#View(independent)

#Take only dependent variables
dependent <- data[-(1:3)]
#View(dependent)

#Check missing values
sapply(independent,function(x)sum(is.na(x)))

#Fill missing variales by mean
age_mean <- mean(data$Age, na.rm = TRUE)
age_mean <- as.integer(age_mean)
salary_mean <- mean(data$Salary, na.rm = TRUE)
salary_mean <- as.integer(salary_mean)

data[is.na(data$Age), "Age"] <- age_mean
data[is.na(data$Salary), "Salary"] <- salary_mean

#Create dummy variables
data$Country <- factor(data$Country,
                       levels = c('France','Spain','Germany'),
                       labels = c(1,2,3))

data$Purchased <- factor(data$Purchased,
                         levels = c('No', 'Yes'),
                         labels = c(0,1))


library(caTools)
set.seed(123)
split <- sample.split(data$Purchased, SplitRatio = 0.8)
train <- subset(data, split == TRUE)
test <- subset(data, split == FALSE)


#Scale the elements
train[,2:3] <- scale(train[,2:3])
test[,2:3] <- scale(test[,2:3])







