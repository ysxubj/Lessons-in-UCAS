import pymysql
db = pymysql.connect(host="localhost",user="root",passwd=None,db="test" )#打开数据库
cursor = db.cursor()# 使用 cursor() 方法创建一个游标对象 cursor
# 使用 execute() 方法执行 SQL，如果表存在则删除
cursor.execute("DROP TABLE IF EXISTS annot")
# SQL 插入语句
sql = """INSERT INTO EMPLOYEE(FIRST_NAME,LAST_NAME, AGE, SEX, INCOME)VALUES ('Mac', 'Mohan', 20, 'M', 2000)"""
try:
   # 执行sql语句
   cursor.execute(sql)
   # 提交到数据库执行
   db.commit()
except:
   # 如果发生错误则回滚
   db.rollback()