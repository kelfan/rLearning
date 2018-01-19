# Title     : TODO
# Objective : TODO
# Created by: Administrator
# Created on: 19/12/2017

# expression
t <- T == TRUE
f <- F == FALSE
a <- b <- 10
(x <- 1:4) # 1 2 3 4
c = class(x)

# Functions
myfunc <- function(x){
    return(x)
}

r1 <- myfunc(1)

myfunc2 <- function(x,y){
    return(x^y)
}

r2 = myfunc2(2,3)

# logical
x=2; y=3;
l1 = x > y

# if condition
myif <- function(x){
    if(x>0){
        return (x);
    }else{
        return (-x);
    }
}

r3 = myif(3)

# loop for
myfor <- function(){
    a <- 1
    for(i in 1:5){
        a <- a+1
    }
    return (a)
}

r4 = myfor()

# String operation: tokenisation
str1 <- strsplit("how are you", " ")
for(i in str1[[1]]){
    if(i == "are"){
        print("yes, we have 'are'")
    }
}

# function sum 汇总
r5 = sum(1,3,5) # 8

# function rep 重复句子
print(rep("hello world", times=3)) # "hello world" "hello world" "hello world"

# function abs 取绝对值
abs(-3) # 3

# function sqrt 开方
sqrt(16) # 4

# function help(functionname)
help(sum)

# example(functionname
example(sqrt)

# list.files() = 列出当前目录下的文件
# setwd("R file path") getwd() 获取或设定工作目录
setwd("~/desktop")
setwd("../")