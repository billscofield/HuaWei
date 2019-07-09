import cv2

img = cv2.imread('boqiu.jpg',1)

cv2.imwrite('a0.jpg',img,[cv2.IMWRITE_JPEG_QUALITY,0]) #[0,100]
cv2.imwrite('a50.jpg',img,[cv2.IMWRITE_JPEG_QUALITY,50]) #[0,100]
