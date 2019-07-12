pip install tensorflow  # 这是cpu版本

tf.add()
tf.multiply()
tf.substract()
tf.divide()

with tf.Session() as sess:
    print(sess.run(code))
