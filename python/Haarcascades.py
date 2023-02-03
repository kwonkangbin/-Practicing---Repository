import cv2

faceCascade = cv2.CascadeClassifier("haarcascade_frontalface_default.xml") #파일 로드 https://answers.opencv.org/question/236975/input-file-is-invalid/
img = cv2.imread('OIP.jpg')
imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

faces = faceCascade.detectMultiScale(imgGray, 1.1, 4) #imgGray 이미지 위에 사각형 그리기

for (x, y, w, h) in faces:
    cv2.rectangle(img,(x, y) + (x + w, y + h), (255, 0, 0), 2)

cv2.imshow("Result", img)
cv2.waitKey(0)
#오류해결
#https://github.com/opencv/opencv/blob/master/data/haarcascades/haarcascade_frontalface_default.xml
