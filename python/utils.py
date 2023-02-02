from djitellopy import Tello
import cv2

def initializeTello():
    myDrone = Tello()
    myDrone.connect()
    print(myDrone.get_battery())
