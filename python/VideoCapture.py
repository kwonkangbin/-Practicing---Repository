import cv2
import numpy

cap = cv2.VideoCapture(0) #숫자는 카메라번호
fourcc = cv2.VideoWriter_fourcc(*'XVID')

writer = cv2.VideoWriter('output.avi',fourcc, 30.0, (640,480))

while True:
    ret, img_color = cap.read()
    if ret == False:
        print(ret)
        continue
        #캡쳐실패

    cv2.imshow("Color",img_color)

    writer.write(img_color)

    if cv2.waitKey(1)&0xFF == 27:
        #27은 ESC
        break

writer.release()
cap.release() #카메라와 컴퓨터의 메모리 연동해제
cv2.destroyAllWindows()
