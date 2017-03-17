library(MASS)
library(klaR)
library(pROC)
library(ggplot2)
library(lattice)
library(caret)
library(e1071)
library(randomForest)
list.files()
mydata<-read.csv("mushrooms.csv")#读入数据
ls()#当前空间内的文件
str(mydata)#数据类型
head(mydata)#数据头
summary(mydata)#概述
n<-nrow(mydata)#样本量
set.seed(1)
row<-sample(1:n,size = 0.75*n)#抽样
train<-mydata[row,]#训练数据占75%
test<-mydata[-row,]#测试数据占25%
prop.table(table(mydata$type))#蘑菇是否有毒总体概率
prop.table(table(train$type))#蘑菇是否有毒train data
prop.table(table(test$type))#蘑菇是否有毒test data
#特征选择
rfeControls_rf <-rfeControl(functions = rfFuncs,method = 'cv',repeats = 5)
summary(rfeControls_rf)
#使用rfe函数进行特征选择				
fs_nb <- rfe(x = train[,-1],y = train[,1],sizes = seq(4,21,by=2),rfeControl = rfeControls_rf)
fs_nb
plot(fs_nb, type = c('g','o'))
fs_nb$optVariables#确定使用的变量名
#建立贝叶斯模型
various<-c('type',fs_nb$optVariables)
fit<-NaiveBayes(type~.,data=train[,various])
fit
#模型预测
pre<-predict(fit,newdata = test[,various][,-1])
head(pre)
model<-head(pre$class)#模型预测结果
obs<-head(test[,1])#观测值
freq<-table(model,obs)
freq
# 模型的准确率
accuracy <- sum(diag(freq))/sum(freq)#diag对角元素
accuracy
#roc函数计算
modelroc <- roc(as.integer(test[,1]), 
                as.integer(factor(pre$class)))
#as.integer 0 1化函数
#绘制ROC图
plot(modelroc, print.auc = TRUE, auc.polygon = TRUE, 
     grid = c(0.1,0.2), grid.col = c('green','red'),
     max.auc.polygon = TRUE, auc.polygon.col = 'steelblue')



