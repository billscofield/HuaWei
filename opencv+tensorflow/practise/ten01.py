import tensorflow as tf
##import os

##os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

data1 = tf.constant(2,dtype=tf.int32)
data2 = tf.Cariable(10,name = 'var')

sess = tf.Session()
#sess = tf.compat.v1.Session()

print(data1)
print(data2)
print('---')
print("sess %s" % sess.run(data2))
##print(data1)
