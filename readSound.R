# install package tuneR 
# https://www.datacamp.com/community/tutorials/machine-learning-in-r
# https://machinelearningmastery.com/machine-learning-in-r-step-by-step/

library(tuneR)
library(seewave)
require(rgl)
a <- readMP3("bb.mp3")
b <- cutw(a, 0, 10)
plot(a@left[30700:44100], type = "l", main = "Snap", xlab = "Time", ylab = "Frequency")
# a@left[30700:44100] a@left sound trace [time start: time end ]
i = c(a@left[30700:30710],"a")
j = sample(a@left[30700:30715], 10)
k = sample(a@left[30700:30770], 10)
length(j) == length(k)
l = c(sample(a@left[30700:30770],2), "a")
m = c(sample(a@left[30900:30999],2), "b")
n = rbind(sample(a@left[30700:30770],2), sample(a@left[30900:30999],2))
o = rbind("a","b")
x = data.frame(n, row.names = c('a', 'b'))
x$class = o
x$class = factor(x$class)

i = 30700
j = 30715 
l = a@left[i:j]

# example
n <- vector()
for(e in 1:90){
  i = 30000 + e
  j = 30000 + e * 30
  if(length(n) == 0){
    n = sample(a@left[i:j],20)
  }else{
    n = rbind(n, sample(a@left[i:j],20))
  }
}

m <- vector()
for(e in 1:90){
  u = sample(1:9,1, replace = T)
  if(u > 5){
    m <- c(m, "yes")
  }else{
    m <- c(m, "no")
  }
}

w <- vector()
for(e in 1:20){
  w <- c(w, toString(e))
}

x = data.frame(n, row.names = rownames(w))
x$class = m
x$class = factor(x$class)
set.seed(1111) 

x.size <- 90
samp <- c(sample(1:x.size, x.size*0.7))
x.tr <- x[samp, ]
x.test <- x[-samp, ]

library(nnet)
model.nnet <- nnet(class ~ ., 
                   data = x.tr,
                   size=2,
                   decay=5e-04,
                   maxit=200)
summary(model.nnet)
save(model.nnet, file="nnet.model")
mod <- get(load("nnet.model"))

# pattern (model) evaluation 
predicted <- predict(model.nnet,
                     x.test,
                     type="class")
predicted


# read xlxs excel 
require(gdata)
df = read.csv("2 Day Annotations.csv", header = TRUE)
