# Title     : TODO
# Objective : TODO
# Created by: Administrator
# Created on: 20/12/2017

# read table data
wine <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data",
    sep=",", # 分隔符为 , comma
    col.names=c("Type","Alcohol","Malic","Ash","Alcalinity","Magnesium","Phenols","Flavanoids","Nonflavanoids","Proanthocyanins","Color","Hue","Dilution","Proline")
)
print(wine)
print(nrow(wine)) # 打印行数 178
print(ncol(wine)) # 打印列数 14
print(summary(wine)) # 统计信息

# attribute to categorical data
wine$Type=factor(wine$Type)
print(summary(wine))

# data pre-processing and transformation: scale 把数值转为0到1之间的数
wine.scale <- cbind(wine[1], scale(wine[-1])) # cbind 横向追加 rbind 纵向追加
print(summary(wine.scale))

# 显示各个特征的标准方差, 确保每个都是一样的, 不然就是某个特征的scale不正确
apply(wine.scale[-1], 2, sd) # 显示标准方差值 这里全部是1

# partitioning the data into training and test data
data.size <- nrow(wine.scale) # 设定大小为行数 
set.seed(1111) # 固定随机数 
samp <- c(sample(1:data.size, data.size*0.7))
data.tr <- wine.scale[samp, ]
data.test <- wine.scale[-samp, ]

summary(data.tr)
summary(data.test)

# data mining using a neural Network classification technique 
print() # install.packages("nnet") # C:\Users\Administrator\AppData\Local\Temp\Rtmp4672lV\downloaded_packages

library(nnet)
model.nnet <- nnet(Type ~ ., 
                   data = data.tr,
                   size=2, # 2 level 
                   decay=5e-04,
                   maxit=200) # stopped after 200 iterations
summary(model.nnet)

# pattern (model) evaluation 
predicted <- predict(model.nnet,
                     data.test,
                     type="class")
predicted

actual <- data.test$Type
model.confusion.matrix <- table(actual, predicted)
model.confusion.matrix # 不是中斜线的就是错误的预测 

confusion.matrix.rate = prop.table(model.confusion.matrix) * 100
round(confusion.matrix.rate, digit=2)

diag.index <- cbind(1:3, 1:3)

error.overall = sum(confusion.matrix.rate) - sum(confusion.matrix.rate[diag.index])
paste("Error Rate =", round(error.overall, digit=2), "%") # 算出错误率 

# Data mining Task using a nearest neighbour approach 
P1=c(1,3) # class Caren lower students 
P2=c(2,4)
P3=c(6,6)

N1=c(2,1) # class Caren hater students
N2=c(5,3)
N3=c(6,4)

train=rbind(P1,P2,P3,N1,N2,N3) # build the classification matrix # rbind 纵向合并 
plot(train)

class=factor(c(rep("lover",3),rep("hater",3))) # [1] lover lover lover hater hater hater
class

test=c(1,4) # testing data to be classified 
test # 1 4 

library(class)
summary(knn(train, test, class, k=3)) # hater 0 lover 1

test=c(6,4)
summary(knn(train, test, class, k=3)) # hater 1 lover 0


