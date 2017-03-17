# 下载并加载所需的应用包
if(!suppressWarnings(require('klaR'))){
  install.packages('klaR')
  require('klaR')
}

if(!suppressWarnings(require('pROC'))){
  install.packages('pROC')
  require('pROC')
}


# 读取蘑菇数据集
mydata <- read.csv(file = file.choose())
# 简单的了解一下数据
str(mydata)
summary(mydata)

# 抽样，并将总体分为训练集和测试集
set.seed(12)
index <- sample(1:nrow(mydata), size = 0.75*nrow(mydata))
train <- mydata[index,]
test <- mydata[-index,]

# 大致查看抽样与总体之间是否吻合
prop.table(table(mydata$type))
prop.table(table(train$type))
prop.table(table(test$type))

# 特征选择
#构建rfe函数的控制参数(使用随机森林函数和10重交叉验证抽样方法，并抽取5组样本)
rfeControls_rf <- rfeControl(
  functions = rfFuncs,
  method = 'cv',
  repeats = 5)

#使用rfe函数进行特征选择				
fs_nb <- rfe(x = train[,-1],
             y = train[,1],
             sizes = seq(4,21,2),
             rfeControl = rfeControls_rf)
fs_nb
plot(fs_nb, type = c('g','o'))
fs_nb$optVariables

# 使用klaR包中的NaiveBayes函数构建朴素贝叶斯算法
vars <- c('type',fs_nb$optVariables)
fit <- NaiveBayes(type ~ ., data = train[,vars])
fit
# 预测
pred <- predict(fit, newdata = test[,vars][,-1])
head(pred$class)

# 构建混淆矩阵
freq <- table(pred$class, test[,1])
freq

# 模型的准确率
accuracy <- sum(diag(freq))/sum(freq)
accuracy

# 模型的AUC值
modelroc <- roc(as.integer(test[,1]), 
                as.integer(factor(pred$class)))
plot(modelroc, print.auc = TRUE, auc.polygon = TRUE, 
     grid = c(0.1,0.2), grid.col = c('green','red'),
     max.auc.polygon = TRUE, auc.polygon.col = 'steelblue')
