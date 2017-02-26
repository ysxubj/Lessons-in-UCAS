# PART ONE
?t.test
??t.test 
apropos("t.test")#同义词
help(t.test)
example(t.test)
getAnywhere(t.test)#网络条件下的同义词搜索
help.start()

#2.1.1向量vector
a <- c(1, 2, 5, 3, 6, -2, 4)     #  数值型向量 
b <- c("one", "two", "three")    #  字符型向釿 
c <- c(TRUE, TRUE, TRUE)         #  逻辑型向釿 
which(a==5)                       #找到符合条件的位罿
intersect(1:10, 7:20)             #寻找两个向量中相同的元素
#注意：单个向量中的数据必须是相同的类垿(数值型、字符型或逻辑垿)???

rep(2:5, 2) #  等价亿  rep(2:5, times = 2) 
rep(2:5, rep(2, 4)) 
rep(1:3, times = 4, each = 2)  

rep(factor(LETTERS[1:3]), 5)
rep(factor(letters[1:3]),5)

a <- c(1, 2, 5, 3, 6, -2, 4)
a[3]
a[c(1, 3, 5)] 
a[2:6]
a[a>3]
a[-1]    
a[-1:-3]


#2.1.3 矩阵matrix，data必须是同一属性数据，如果不是，会自动调整为同一属性，vector类同
matrix(1:4, nrow = 2, ncol = 2)    
diag(3)#单位阵
mat1<-matrix(1:12,3,4, byrow=T)
mat1
mat2<-matrix(1:12,3,4, byrow=F)
mat2
x <- matrix(1:6, 2, 3) 
x[2,2]
x[2,]
x[,2]
x[2,2:3]

#2.1 数据框data frame
patientID <- c(1, 2, 3, 4) 
age <- c(25, 34, 28, 52) 
diabetes <- c("Type1", "Type2", "Type1", "Type1") 
status <- c("Poor", "Improved", "Excellent", "Poor") 
patientdata <- data.frame(patientID, age, diabetes, status) 

patientdata[1:2] #  笿 1???2 列的所有元紿 
patientdata$age    #???$”符合用于选取一个指定的变量


# 列表list
g <- "My First List" 
h <- c(25, 26, 18, 39) 
j <- matrix(1:10, nrow = 5) 
k <- c("one", "two", "three") 
mylist <- list(title = g, ages = h, j, k)  #list是百货公司，list甚至可以自己装list
mylist

#因子factor
province <- c("四川", "湖南", "江苏", "四川", "四川", "四川", "湖南", "江苏", "湖南", "江苏")     
pf <- factor(province)    #  创建 province 的因孿 pf 
pf 
# 2.2 数据的输兿
#1   键盘输入
mydata <- data.frame(age = numeric(0),                       
                     gender = character(0), weight = numeric(0) ) 
mydata <- edit(mydata)    #  输入或修政 mydata 中的数据



#2  导入 text 和csv 文件，当前工作目录下
mydata2 <- read.table(file = "oats.txt", header=T)
mydata2 
mydata3 <- read.csv( file = "oats.csv", header=T) 
mydata3
mydata4 <- read.csv( file.choose(), header=T) 
mydata4

#加盘笿""，其他类型数据输入看ppt
#install.packages("foreign")
library(foreign)
x = read.spss("sps.sav", to.data.frame=TRUE) # Read file sps.sav

#2.3 数据的存傿
df<-data.frame(obs = c(1, 2, 3), treat = c("A", "B", "A"), weight = c(2.3, NA, 9))

write.table(df, file = "D:/fg.txt", row.names = F, quote = F )
write.csv(df, file = "D:/fg.csv")
save(df, file = "D:/fg.Rdata")

#3.1 变量创建与删陿
mydata <- data.frame(x1 = c(2, 2, 6, 4), x2 = c(3, 4, 2, 8) )
mydata
#  方法一
mydata$sum <- mydata$x1 + mydata$x2
mydata
mydata$mean <- (mydata$x1 + mydata$x2)/2
mydata

#  方法亿
mydata <- transform(mydata,sum=x1+x2,mean=(x1+x2)/2)
mydata

#  变量删除
mydata$mean <- NULL 
mydata
#3.2 变量的重命名
df <- mydata
fix(df)
names(df)
names(df)[1:3] <- c("A", "B", "C")
df

#3.3 缺失倿
x <- c(1:3,5,7,NA,9)
sum(x) #  结果丿 NA
sum(x, na.rm=T) #  结果丿 27


#3.5 数据的排序（order)

df <- data.frame (id = 1:4,weight = c(20, 27, 24, 26),size = c("small", "large", "medium", "large"))
df
# R 自带皿 order( )函数
df[order(df$weight), ]
df[order(df$size,df$weight), ]
df[order(df$size,-df$weight), ]

# plyr 包的 arrange( )函数
library(plyr)
arrange(df, weight)
arrange(df, size, weight)
arrange(df, size, -weight)


#行合并和列合广 

example(rbind)
example(cbind)

#3.7 数据子集的提叿
###  创建数据桿
df <- read.table( header = T, text = '
                  subject sex size
                  1 M 7
                  2 F 6
                  3 F 9
                  4 M 11
                  ')
df
###  以行取子雿
df[1, ]
df[c(1,3), ]

###  以列取子雿
df[ ,1]
df[ ,c(1,3)]

###  以行列组合取子集
df[c(1,3), c(1,3)]

df[ ,"size"]  ##  返回向量 
df[ "size"]  ##  返回数据桿

df[ ,c("size","sex")]

subset(df, select = subject)
subset(df, subject < 3)
subset(df, subject < 3, select = -subject) 
subset(df, subject < 3 & sex=="M")
subset(df, subject < 3 | sex=="M")

#数据结构查看
dim(iris)      	 #  数据集的维度，有多少行多少列＿
names(iris)    #  数据有哪些列＿
str(iris)        	 #  数据的结构如何？
iris[1:5, ]      	 #  查看数据的前 5 衿
head(iris)      #  查看数据的前 6 衿
tail(iris)      	 #  查看数据的最吿 6 衿
#  查看数据集中所有变量的统计釿
summary(iris)

#  单个变量皿 0%???25%???50%???75%???100%分位敿
quantile(iris$Sepal.Length)

#  返回均值、中位数和数据的范围
# mean( )，median( )，range( )


sapply(iris[,-5],mean,na.rm=T)
apply(iris[,-5],2,mean,na.rm=T)
apply(iris[,-5],1,mean,na.rm=T)
tapply(iris[,2],iris[,5],var)
#如何计算双变量的情况
iris$nw=rep(rep(c("A","B"),rep(25,2)),3)
iris$nw2=factor(paste(iris$Species,iris$nw))
tapply(iris[,2],iris[,7],var)

