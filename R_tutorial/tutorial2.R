# Title     : TODO
# Objective : TODO
# Created by: Administrator
# Created on: 19/12/2017

# data handling
id <- c(1,2,3,4,5)
gender <- c("F","F","M","M","M")
height <- c(160,165,170,175,180)
weight <- c(50,65,60,55,70)
MYDATA <- data.frame(ID=id,GENDER=gender,HEIGHT=height,WEIGHT=weight)
print(MYDATA)

# read data from txt
print("MYdatatxt")
MYdatatxt <- read.table("E:/googledriver/vb_project/20171217R_Decision_Tree/Caren_R_tutorial/tutorial2.txt", header=T)
print(MYdatatxt)

print("MYdatatxt2")
MYdatatxt2 <- read.table("tutorial2.txt",header=T)
print(MYdatatxt2)

# read data from csv
Mydatacsv <- read.csv("300201.csv",head=T)
print(Mydatacsv)

# summary of dataset 中位数 平均数等
print(summary(Mydatacsv))

# summary of specific Column 中位数 平均数 等
print(summary(Mydatacsv$open))

# attach to R search path  直接使用名字
attach(Mydatacsv)
print(names(Mydatacsv))
print(summary(open))

# scatter plot 描绘散点图
plot(open, close)
plot(open,close, col="red")
plot(open,close, col="green")
plot(open,close, col="blue")
plot(open,close,col="red",xlab="open price",ylab="close price")

# scatter plot add fit lines 加线条
abline(lm(open~close)) # 一条直线
lines(lowess(open,close),col="blue") # 一条折线

# scatter plot pch 改变点的形状
plot(open,close,col="red",xlab="open price", ylab="close price", pch=16) # 圆点
plot(open,close,col="red",xlab="open price", ylab="close price", pch=17) # 三角形
plot(open,close,col="red",xlab="open price", ylab="close price", pch=22) # 方框

# strip dot plot 尺子线轴点 类似横着的时间轴
stripchart(open,
method="stack",
pch=19,
main="open price",
col="red",
offset=0.5, # 点与点之间的距离
xlab="Price")

# histogram 柱状图
hondaprice <- c(7.4,7.5,7.7,7.9,8.1,8.3,8.5,8.7,8.9,9.1,9.3,9.5,9.6,9.8,10.0,10.2,10.4,10.6,10.8,11.0,11.2,11.4,11.5,11.7,11.9,12.1,12.3,12.5,12.7,12.9,13.1,13.3,13.5,13.6,13.8,14.0,15.4,15.5,15.7,15.9,16.1,16.3,16.5,16.7,16.9,17.1,17.3,17.5,17.6,17.8,18.0,18.2,18.4,18.6,18.8,19.0,19.2,19.4,19.5,19.7,19.9,20.1,20.3,20.5,20.7,25.3,26.2,35.3,36.2,60.1)
hist(hondaprice)
hist(hondaprice, breaks=10)
hist(hondaprice, breaks=seq(0,70,10)) # 范围 0 - 70,条宽10
hist(hondaprice, breaks=seq(0,70,5)) # 范围 0 - 79, 条宽 5
hist(hondaprice, breaks=seq(0,80,2)) # 范围 0 - 80 ,条宽2
hist(hondaprice, breaks=seq(0,70,10), main="Breaks=10") # 改变标题
hist(hondaprice, main="Frequency") # 改变标题
hist(hondaprice, main="Density", freq=FALSE) #频率变小数点

# histogram with distribution curve
hist(hondaprice,
    freq=FALSE,
    xlab="honda Price",
    main="distribution of honda price",
    col="green",
    xlim=c(0,70), # 范围 0 - 70
    ylim = c(0,0.05) # 范围 0 - 0.05
)
curve(dnorm(x,
    mean=mean(hondaprice),
    sd=sd(hondaprice)),
    add=TRUE,
    col="red",
    lwd=2
)

# box plot  方形盒子
MYdatatxt3 <- read.table("tutorial2.txt",header=T)
grade <- MYdatatxt3
boxplot(grade$HEIGHT,
    col="green",
    ylim=c(20,190),
    xlab="height",
    ylab="grade"
)
boxplot(grade$HEIGHT, grade$WEIGHT,
    names=c("height","weight"),
    col=c("green","red"),
    ylim=c(20,190)) # whisker -> 75th percenttile -> Median -> 25th percentile -> whisker -> outlier

