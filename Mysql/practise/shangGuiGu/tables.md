## 表结构

myemployees> desc employees;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| employee_id    | int(6)       | NO   | PRI | <null>  | auto_increment |   员工编号
| first_name     | varchar(20)  | YES  |     | <null>  |                |   名字
| last_name      | varchar(25)  | YES  |     | <null>  |                |   姓
| email          | varchar(25)  | YES  |     | <null>  |                |
| phone_number   | varchar(20)  | YES  |     | <null>  |                |
| job_id         | varchar(10)  | YES  | MUL | <null>  |                |   工种编号
| salary         | double(10,2) | YES  |     | <null>  |                |
| commission_pct | double(4,2)  | YES  |     | <null>  |                |   奖金率
| manager_id     | int(6)       | YES  |     | <null>  |                |
| department_id  | int(4)       | YES  | MUL | <null>  |                |
| hiredate       | datetime     | YES  |     | <null>  |                |
+----------------+--------------+------+-----+---------+----------------+


desc departments;
+-----------------+------------+------+-----+---------+----------------+
| Field           | Type       | Null | Key | Default | Extra          |
+-----------------+------------+------+-----+---------+----------------+
| department_id   | int(4)     | NO   | PRI | <null>  | auto_increment |
| department_name | varchar(3) | YES  |     | <null>  |                |
| manager_id      | int(6)     | YES  |     | <null>  |                |
| location_id     | int(4)     | YES  | MUL | <null>  |                |    地区，位置
+-----------------+------------+------+-----+---------+----------------+


desc locations;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| location_id    | int(11)     | NO   | PRI | <null>  | auto_increment |
| street_address | varchar(40) | YES  |     | <null>  |                |
| postal_code    | varchar(12) | YES  |     | <null>  |                |
| city           | varchar(30) | YES  |     | <null>  |                |
| state_province | varchar(25) | YES  |     | <null>  |                |
| country_id     | varchar(2)  | YES  |     | <null>  |                |
+----------------+-------------+------+-----+---------+----------------+


desc jobs;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| job_id     | varchar(10) | NO   | PRI | <null>  |       |
| job_title  | varchar(35) | YES  |     | <null>  |       |     工种名称
| min_salary | int(6)      | YES  |     | <null>  |       |
| max_salary | int(6)      | YES  |     | <null>  |       |
+------------+-------------+------+-----+---------+-------+

