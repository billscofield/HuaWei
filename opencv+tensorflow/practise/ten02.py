import tensorflow as tf

# -----------------
##two_node = tf.constant(2)
##print(two_node)

# -----------------
##two_node = tf.constant(2)
##another_two_node = tf.constant(2)
##two_node = tf.constant(2)
##tf.constant(3)

# -----------------
two_node = tf.constant(2)
another_pointer_at_two_node = two_node
two_node = None
print(two_nodeprint,another_pointer_at_two_node)

