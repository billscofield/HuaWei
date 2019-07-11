import cv2

img = cv2.imread('boqiu.jpg',1)

cv2.imshow('hello',img)

cv2.waitKey(3000)

print(img.cols)
