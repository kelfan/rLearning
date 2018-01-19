# Title     : TODO
# Objective : TODO
# Created by: Administrator
# Created on: 20/12/2017

# bar chart 条形图 柱状图
barplot(1:10)
barplot(1:10,names.arg=1:10) # 显示底下的坐标

dogcsv<-read.csv("dog.csv",head=T)
print(dogcsv)
barplot(
    dogcsv$attractive.dogs, # 显示的数值
    names.arg=dogcsv$location, # 显示的列或者分类
    main="attractive dogs", # 标题
    xlab="location", # 横轴标题
    ylab="total", # 纵轴标题
    border="blue", # 边框颜色
    col="green" # 条形颜色
)

barplot(
    dogcsv$dangerous.dogs, # 显示的数值
    names.arg=dogcsv$location, # 显示的列或者分类
    main="dangerous dogs", # 标题
    xlab="location", # 横轴标题
    ylab="total", # 纵轴标题
    border="Black", # 边框颜色
    col="red" # 条形颜色
)

barplot(
    dogcsv$others, # 显示的数值
    names.arg=dogcsv$location, # 显示的列或者分类
    main="others dogs", # 标题
    xlab="location", # 横轴标题
    ylab="total", # 纵轴标题
    border="Black", # 边框颜色
    col="grey" # 条形颜色
)

# mosaic plot 区块图
require(stats) # 导入数据集
print(Titanic)
help(Titanic)
mosaicplot(Titanic)

# pie chart 饼图
x=1:10
pie(x,labels=LETTERS[1:10]) # 逆时针
pie(x,labels=LETTERS[1:10],main="pie chart", clockwise=T) # 顺时针
pie(x,labels=LETTERS[1:10],main="pie chart", init.angle=45) # 第一个在45度位置
pie(x,labels=LETTERS[1:10],main="pie chart", init.angle=90) # 第一个在90度位置

dog_per<-round(dogcsv$others/sum(dogcsv$others)*100)
print(dog_per) # [1] 37 19  4 19  7 15
labels<-paste(dogcsv$location,dog_per,"%",sep=" ")
print(labels) # [1] "sandy bay 37 %"    "Hobart 19 %"       "battery point 4 %"
pie(dogcsv$others,labels=labels,main="other dogs")
pie(
    dogcsv$others,# 数值
    labels=labels, # 每个显示的标签
    main="other dog", # 标题
    col=rainbow(length(labels)) # 彩色显示
)
