import cv2

img = cv2.imread('boqiu.jpg',1)

cv2.imwrite('a.png',img,[cv2.IMWRITE_PNG_COMPRESSION,0])
cv2.imwrite('b.png',img,[cv2.IMWRITE_PNG_COMPRESSION,9])
