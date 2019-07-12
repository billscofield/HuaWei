import cv2

img = cv2.imread('boqiu.jpg',1)

#b,g,r = img[100,100]

#print(b,g,r)

for i in range(0,427):
    img[i,200] = (255,255,255)

cv2.imshow('hello',img)
cv2.waitKey(0)
