
# iris data set
library(RWeka)
iris
datairis<-iris
datairis$Species<-NULL
datairis 

# partitional clustering: K means clustering 
kcluster<-kmeans(datairis,3) # k as 3, divide into 3 species
kcluster
kcluster$cluster
kcluster$centers

plot(datairis[c("Sepal.Width","Petal.Width")],col=kcluster$cluster)
points(kcluster$centers[,c("Sepal.Width","Petal.Width")], col=1:3, pch=8, cex=2)

plot(datairis[c("Sepal.Length","Petal.Length")],col=kcluster$cluster)
points(kcluster$centers[,c("Sepal.Length","Petal.Length")], col=1:3, pch=8, cex=2)

plot(datairis[c("Petal.Length","Petal.Length")],col=kcluster$cluster)
points(kcluster$centers[,c("Petal.Length","Petal.Length")], col=1:3, pch=8, cex=2)

iris$Species
table(iris$Species,kcluster$cluster) # Check the result through a table 

# hierarchical clustering 
dim(iris)[1] # dim:	It	retrieve	or	set	the	dimension	of	an	object
random = sample(1:dim(iris)[1],50) # 50 个 1 到 数据边缘的随机数 
datairis = iris[random,]
datairis$Species=NULL
datairis

hcluster<-hclust(dist(datairis),method="ave")
hcluster
plot(hcluster,hang=-1) # hang:	The	fraction	of	the	plot	height	by	which	labels	should	hang	below	the	rest	of	the	plot.	A	negative	value	will	cause	the	labels	to	hang	down	from	0.

iris$Species
plot(hcluster,hang=-1,labels=iris$Species[random])
