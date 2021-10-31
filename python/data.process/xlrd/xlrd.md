
### 安装

pip install xlrd


### xlrd 常用函数

book = xlrd.open_workbook('文件名')

默认打开所有 sheet

#### sheet

book.sheets()           所有工作表

    选择工作表的三种方法
        1. book.sheets()[0]
        1. book.sheet_by_index(self,sheetx)
        1. book.sheet_by_name(self,sheet_name)

book.nsheets            sheet的数量


book.sheet_names()      所有sheet的名字

book.sheet_loaded(0)    第0个sheet是否被加载了

book.unload_sheet(0)    卸载第0个sheet



### xlrd 操作 Excel 行

sheet.nrows             当前sheet的有效行数
sheet.row(行)           第n行的内容, "单元格对象"组成的列表
sheet.row_types(行)     第n行的数据类型组成的列表
    1: 字符串,即text
    2: number
    3: data
    4: bool
    5: error
sheet.row(行)[列].value

sheet.row_values(行)    第n行单元格的值组成的列表



book = xlrd.open_workbook('aaa.xls')
sheet_target = book.sheet_by_index(0)


### xlrd 操作 Excel 列


### xlrd 操作 Excel 单元格
