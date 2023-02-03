from utlis import *

myDrone = initializeTello()

w, h = 360, 240

while True:
    img = telloGetFrame(myDrone, w, h)
    cv2.imshow('Image', img)
    if cv2.waitKey(1) & 0xff == 27:
        myDrone.land()
        break

#djitellopy 1.5 numpy 1.19.0 opencv-python 4.3.0.36
