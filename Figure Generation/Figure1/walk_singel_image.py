# Import the os module, for the os.walk function
import numpy as np # Matrix Operations
import cv2         # Image Handling
import dlib        # Face Recognition
import os          # Path management
import glob        # Path scanning
 
#warnings.filterwarnings("ignore", category=np.VisibleDeprecationWarning) 
cascade_path = "E:\\MMI Video\\AAM\\haarcascade_frontalface_default.xml"  
predictor_path= "E:\\MMI Video\\AAM\\shape_predictor_68_face_landmarks.dat"  
# Create the haar cascade  
faceCascade = cv2.CascadeClassifier(cascade_path)  
# create the landmark predictor  
predictor = dlib.shape_predictor(predictor_path)
 
# Set the directory you want to start from
filename = 'E:\\MMI Video\\AAM\\AB.jpg'



  
# Detect faces in the image 
#print(fname)
img = cv2.imread(filename,0)
faces = faceCascade.detectMultiScale(  
img,  
scaleFactor=1.05,  
minNeighbors = 5,  
minSize=(500, 500),  
flags=cv2.CASCADE_SCALE_IMAGE  
)
     
print("Found {0} faces! in {1} image".format(len(faces),filename))

for (x, y, w, h) in faces:

	dlib_rect = dlib.rectangle(int(x), int(y), int(x + w), int(y + h))   
	detected_landmarks = predictor(img, dlib_rect).parts()
	pts = np.matrix([(p.x, p.y) for p in detected_landmarks],dtype=np.int32)
	pts = np.asarray(pts);
	filename = filename[0:len(filename)-4] + '.pts';
	# print(pts)
	np.savetxt(filename,pts,fmt='%4d');
    
print('Scan complete')