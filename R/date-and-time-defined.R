#############################不同变量类型##############################
a<-c(1,2,3,4,5,6)#数值型变量
is.numeric(a)
b<-as.character(a)#转化为字符型数据
is.character(b)
c<-c("y","x","s")#字符型变量
mode(c)
d<-c(T,F,T,T)#逻辑型变量
mode(d)
##############################时间对象的转换###########################
date<-c("2017/01/01")#字符串
mode(date)#查看变量类型
date<-as.Date(date,format="%Y/%m/%d")#as.Date()将字符串转换为日期变量
mode(date)
time<-c("2017-02-01-10:02:02")
as.POSIXlt(time,tz="",format = "%Y-%m-%d-%H:%M:%S")#将日期时间转为数值型时间日期变量
time<-c("2017-02-01-10:02:02")
time<-strptime(time,format = "%Y-%m-%d-%H:%M:%S")#将日期时间转为数值型时间日期变量
test<-strftime(time,format = "%Y/%m/%d")#转为字符型日期
mode(test)
