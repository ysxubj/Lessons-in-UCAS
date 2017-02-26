# PART ONE
?t.test
??t.test 
apropos("t.test")#ͬ���
help(t.test)
example(t.test)
getAnywhere(t.test)#���������µ�ͬ�������
help.start()

#2.1.1����vector
a <- c(1, 2, 5, 3, 6, -2, 4)     #  ��ֵ������ 
b <- c("one", "two", "three")    #  �ַ������Y 
c <- c(TRUE, TRUE, TRUE)         #  �߼������Y 
which(a==5)                       #�ҵ�����������λ�Z
intersect(1:10, 7:20)             #Ѱ��������������ͬ��Ԫ��
#ע�⣺���������е����ݱ�������ͬ������(��ֵ�͡��ַ��ͻ��߼���)???

rep(2:5, 2) #  �ȼ���  rep(2:5, times = 2) 
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


#2.1.3 ����matrix��data������ͬһ�������ݣ�������ǣ����Զ�����Ϊͬһ���ԣ�vector��ͬ
matrix(1:4, nrow = 2, ncol = 2)    
diag(3)#��λ��
mat1<-matrix(1:12,3,4, byrow=T)
mat1
mat2<-matrix(1:12,3,4, byrow=F)
mat2
x <- matrix(1:6, 2, 3) 
x[2,2]
x[2,]
x[,2]
x[2,2:3]

#2.1 ���ݿ�data frame
patientID <- c(1, 2, 3, 4) 
age <- c(25, 34, 28, 52) 
diabetes <- c("Type1", "Type2", "Type1", "Type1") 
status <- c("Poor", "Improved", "Excellent", "Poor") 
patientdata <- data.frame(patientID, age, diabetes, status) 

patientdata[1:2] #  �J 1???2 �е�����Ԫ�H 
patientdata$age    #???$����������ѡȡһ��ָ���ı���


# �б�list
g <- "My First List" 
h <- c(25, 26, 18, 39) 
j <- matrix(1:10, nrow = 5) 
k <- c("one", "two", "three") 
mylist <- list(title = g, ages = h, j, k)  #list�ǰٻ���˾��list���������Լ�װlist
mylist

#����factor
province <- c("�Ĵ�", "����", "����", "�Ĵ�", "�Ĵ�", "�Ĵ�", "����", "����", "����", "����")     
pf <- factor(province)    #  ���� province ����\ pf 
pf 
# 2.2 ���ݵ����
#1   ��������
mydata <- data.frame(age = numeric(0),                       
                     gender = character(0), weight = numeric(0) ) 
mydata <- edit(mydata)    #  ��������� mydata �е�����



#2  ���� text ��csv �ļ�����ǰ����Ŀ¼��
mydata2 <- read.table(file = "oats.txt", header=T)
mydata2 
mydata3 <- read.csv( file = "oats.csv", header=T) 
mydata3
mydata4 <- read.csv( file.choose(), header=T) 
mydata4

#���̹J""�����������������뿴ppt
#install.packages("foreign")
library(foreign)
x = read.spss("sps.sav", to.data.frame=TRUE) # Read file sps.sav

#2.3 ���ݵĴ�B
df<-data.frame(obs = c(1, 2, 3), treat = c("A", "B", "A"), weight = c(2.3, NA, 9))

write.table(df, file = "D:/fg.txt", row.names = F, quote = F )
write.csv(df, file = "D:/fg.csv")
save(df, file = "D:/fg.Rdata")

#3.1 ����������ɾ�
mydata <- data.frame(x1 = c(2, 2, 6, 4), x2 = c(3, 4, 2, 8) )
mydata
#  ����һ
mydata$sum <- mydata$x1 + mydata$x2
mydata
mydata$mean <- (mydata$x1 + mydata$x2)/2
mydata

#  ������
mydata <- transform(mydata,sum=x1+x2,mean=(x1+x2)/2)
mydata

#  ����ɾ��
mydata$mean <- NULL 
mydata
#3.2 ������������
df <- mydata
fix(df)
names(df)
names(df)[1:3] <- c("A", "B", "C")
df

#3.3 ȱʧ��
x <- c(1:3,5,7,NA,9)
sum(x) #  ���د NA
sum(x, na.rm=T) #  ���د 27


#3.5 ���ݵ�����order)

df <- data.frame (id = 1:4,weight = c(20, 27, 24, 26),size = c("small", "large", "medium", "large"))
df
# R �Դ��� order( )����
df[order(df$weight), ]
df[order(df$size,df$weight), ]
df[order(df$size,-df$weight), ]

# plyr ���� arrange( )����
library(plyr)
arrange(df, weight)
arrange(df, size, weight)
arrange(df, size, -weight)


#�кϲ����кϹ� 

example(rbind)
example(cbind)

#3.7 �����Ӽ����ᅷ
###  �������ݗU
df <- read.table( header = T, text = '
                  subject sex size
                  1 M 7
                  2 F 6
                  3 F 9
                  4 M 11
                  ')
df
###  ����ȡ���
df[1, ]
df[c(1,3), ]

###  ����ȡ���
df[ ,1]
df[ ,c(1,3)]

###  ���������ȡ�Ӽ�
df[c(1,3), c(1,3)]

df[ ,"size"]  ##  �������� 
df[ "size"]  ##  �������ݗU

df[ ,c("size","sex")]

subset(df, select = subject)
subset(df, subject < 3)
subset(df, subject < 3, select = -subject) 
subset(df, subject < 3 & sex=="M")
subset(df, subject < 3 | sex=="M")

#���ݽṹ�鿴
dim(iris)      	 #  ���ݼ���ά�ȣ��ж����ж����У�
names(iris)    #  ��������Щ�У�
str(iris)        	 #  ���ݵĽṹ��Σ�
iris[1:5, ]      	 #  �鿴���ݵ�ǰ 5 ��
head(iris)      #  �鿴���ݵ�ǰ 6 ��
tail(iris)      	 #  �鿴���ݵ���� 6 ��
#  �鿴���ݼ������б�����ͳ���Y
summary(iris)

#  ���������� 0%???25%???50%???75%???100%��λ��
quantile(iris$Sepal.Length)

#  ���ؾ�ֵ����λ�������ݵķ�Χ
# mean( )��median( )��range( )


sapply(iris[,-5],mean,na.rm=T)
apply(iris[,-5],2,mean,na.rm=T)
apply(iris[,-5],1,mean,na.rm=T)
tapply(iris[,2],iris[,5],var)
#��μ���˫���������
iris$nw=rep(rep(c("A","B"),rep(25,2)),3)
iris$nw2=factor(paste(iris$Species,iris$nw))
tapply(iris[,2],iris[,7],var)

