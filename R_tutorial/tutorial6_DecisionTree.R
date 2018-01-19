# Title     : TODO
# Objective : TODO
# Created by: Administrator
# Created on: 21/12/2017

# wine data Set 
wine <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data",
                   sep=",", # 分隔符为 , comma
                   col.names=c("Type","Alcohol","Malic","Ash","Alcalinity","Magnesium","Phenols","Flavanoids","Nonflavanoids","Proanthocyanins","Color","Hue","Dilution","Proline")
)

# partitioning the data into training and test data 
data.size <- nrow(wine.scale)
set.seed(1111)
samp <- c(sample(1:data.size), data.size * 0.7)
data.tr <- wine.scale[samp, ]
data.test <- wine.scale[-samp, ]
summary(data.tr)
summary(data.test)

# Error: package or namespace load failed for ‘rJava’:
if(Sys.getenv("JAVA_HOME")!=""){
  Sys.setenv(JAVA_HOME="")
}
Sys.setenv(JAVA_HOME = "D:\\Program Files\\Java\\jdk1.8.0_151")
library(rJava)
library("RWeka")

# data mining with RWeka 
print() # install.packages("RWeka") #  C:\Users\Administrator\AppData\Local\Temp\Rtmp4672lV\downloaded_packages

wine<-read.table("E:\\googledriver\\vb_project\\20171217R_Decision_Tree\\Caren_R_tutorial\\wine.data",
                 sep=",",
                 col.names = c("Type","Alcohol","Malic","Ash","Alcalinity","Magnesium", "Phenols","Flavanoids", "Nonflavanoids", "Proanthcyanins", "Color", "Hue", "Dilution", "Proline"))
wine$Type=factor(wine$Type)

# Data mining using J48 Decision Tree classifier 
wine.scale <- cbind(wine[1], scale(wine[-1])) # cbind 横向追加 rbind 纵向追加
data.size <- nrow(wine.scale)
set.seed(1111)
samp <- c(sample(1:data.size, data.size * 0.7))
data.tr <- wine.scale[samp, ]
data.test <- wine.scale[-samp, ]

wine_dt=J48(Type~.,data=data.tr)
wine_dt

prediction_dt = predict(wine_dt, data.test[,2:14]) # 前面是模型,后面是处理class的features
prediction_dt

actual=data.test$Type
model.confusion.matrix=table(actual,prediction_dt)
model.confusion.matrix

# K-fold cross validation 
wine_dt=J48(Type~., data=wine)
wine_dt
eval_j48 <- evaluate_Weka_classifier(wine_dt,
                                     numFolds = 10,
                                     complexity = FALSE,
                                     seed=1,
                                     class=TRUE) # K-fold 十次
eval_j48

# Data mining using SMO support vector machine classifier
wine_svm=SMO(Type~., data=wine)
wine_svm

eval_svm <- evaluate_Weka_classifier(
  wine_svm,
  numFolds = 10,
  complexity = FALSE,
  seed = 1,
  class = TRUE
)
eval_svm

eval_svm[4]
eval_svm[4]$confusionMatrix[1] # 上往下一个个显示
eval_svm[4]$confusionMatrix[2]
eval_svm[4]$confusionMatrix[3]
eval_svm[4]$confusionMatrix[4]
eval_svm[4]$confusionMatrix[5]

# other packages for DecisionTree 
install.packages("party") # C:\Users\Administrator\AppData\Local\Temp\Rtmp4672lV\downloaded_packages

library("party")
wine_ctree <- ctree(Type~.,data=wine)
wine_ctree

plot(wine_ctree)

wine_dt
install.packages("partykit")
Sys.setenv(JAVA_HOME="D:\\Program Files\\Java\\jdk1.8.0_151\\")
plot(wine_dt)

