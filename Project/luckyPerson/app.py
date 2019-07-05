import xlrd
import random
import sys


data = xlrd.open_workbook('names.xls')

sheet1 = data.sheets()[0]

rows = sheet1.nrows

name_list = []

#num = int(sys.argv[1])

for i in range(rows):
    name_list.append(tuple(sheet1.row_values(i)))


#res = random.sample(name_list,2)


def luckyPerson(num=1):
    result = random.sample(name_list,num)
    for i in range(len(result)):
        #print(result)
        print("地区:%s  姓名:%s" % (result[i][0],result[i][1]))
        
if __name__ == '__main__':
    luckyPerson()


