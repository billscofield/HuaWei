pip install PyMySQL   (pymysql)

db = pymysql.connect(host='localhost',user='root',password='root',db='mydb')

cursor = db.cursor()

sql = 'select database()' 

cursor.execute(sql)
cursor.executemany("insert into hosts(host,color_id) values(%s,%s)", [("1.1.1.11",1),("1.1.1.11",2)])

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

rowcount: 这是一个只读属性，并返回执行execute()方法后影响的行数。


## insert 语句
insertSql = "INSERT INTO teacher(name,stu_name) VALUES('%s','%s')" % ('liu','li')
insertSql2 = "INSERT INTO stu(name,age) VALUES('%s',%d)" % ('xian',3)


变量式
insertSql = "INSERT INTO teacher(name,stu_name) VALUES('%s','%s')"
rows = cursor.execute(insertSql%('liuzixian','liujiaolong'))

