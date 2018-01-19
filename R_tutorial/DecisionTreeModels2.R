# read data From File
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

# J48 Model 
Sys.setenv(JAVA_HOME = "D:\\Program Files\\Java\\jdk1.8.0_151")
library(RWeka)
wine_dt=J48(Type~.,data=data.tr)
wine_dt

prediction_dt = predict(wine_dt, data.test[,2:14],Type="node") # 前面是模型,后面是处理class的features
prediction_dt

# rpart get tree rules 
library(rpart)

res = rpart(Type ~., data = data.tr)
res

terminal_nodes = rownames(res$frame)[res$frame$var =="<leaf>"]
path.rpart(res ,nodes=terminal_nodes)
rules = path.rpart(res ,nodes=terminal_nodes)
listed_rules = unlist(rules)
sapply(rules,"[",-1)

frm <- res$frame
names <- row.names(frm)

prediction_dt = predict(res, data.test[,2:14], type="matrix")
prediction_dt

# party
update.packages()
Sys.setenv(JAVA_HOME = "D:\\Program Files\\Java\\jdk1.8.0_151")
#install.packages("zoo")
#install.packages("party")
#install.packages("sandwich")
library(party)
mparty = party(Type ~., data = data.tr)
mparty
mparty_predict = predict(mparty,data.test[,2:14], type="node")

# party ctree()
p_ctree <- ctree(Type ~., data=data.tr)
plot(p_ctree)
ctree_class <- predict(p_ctree,data.test[,2:14], type="response")
ctree_class 
test_ctree <- predict(p_ctree,data.test[,2:14], type="node")
test_ctree
