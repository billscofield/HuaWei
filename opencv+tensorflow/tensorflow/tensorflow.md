pip install tensorflow  # 这是cpu版本

tf.add()
tf.multiply()
tf.substract()
tf.divide()

with tf.Session() as sess:
    print(sess.run(code))

一般矩阵乘积。它只有在第一个矩阵的列数（column）和第二个矩阵的行数（row）相同时才有意义

一般单指矩阵乘积时，指的便是一般矩阵乘积。

第一矩阵的列数 = 第二矩阵的行数

结果的行数有第一矩阵的行数决定，结果的列数由第二矩阵决定
