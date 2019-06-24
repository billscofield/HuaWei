pip install PyMySQL   (pymysql)

db = pymysql.connect(host='localhost',user='root',password='root',db='mydb')

cursor = db.cursor()

sql = 'select database()' 

cursor.execute(sql)

data1=cursor.fetchone()

print('Database version is %s" % data1)

curosr.close()

db.close()



cursor = db.cursor(cursor=pymysql.cursors.DictCursor)    //返回字典形式


cursor.scroll(-1,mode='relative')
cursor.scroll(1,mode='absolute')
    absolute 从零开始


cursor.fetchone()
cursor.fetchmany(Number)
cursor.fetchall()


## insert 语句
insertSql = "INSERT INTO teacher(name,stu_name) VALUES('%s','%s')" % ('liu','li')
insertSql2 = "INSERT INTO stu(name,age) VALUES('%s',%d)" % ('xian',3)


变量式
insertSql = "INSERT INTO teacher(name,stu_name) VALUES('%s','%s')"
rows = cursor.execute(insertSql%('liuzixian','liujiaolong'))

