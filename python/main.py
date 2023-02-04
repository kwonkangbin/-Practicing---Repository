import numpy as np

from utlis import *

myDrone = initializeTello()
pid = [0.5, 0.5, 0]
w, h = 360, 240
pError = 0
startCounter = 1#0으로 바꾸면 난다

while True:
    if startCounter == 0:
        myDrone.takeoff()
        startCounter = 1
    img = telloGetFrame(myDrone, w, h)
    img, info = findFace(img)
    #print(info)
    pError = trackFace(myDrone, info, w, pid, pError)
    cv2.imshow('Image', img)
    if cv2.waitKey(1) & 0xff == 27:
        myDrone.land()
        break


#djitellopy 1.5 numpy 1.19.0 opencv-python 4.3.0.36
