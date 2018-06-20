from keras.models import load_model
classifier = load_model('bird_model.h5')

#Making new predictions
import numpy as np
from keras.preprocessing import image
test_image = image.load_img('dataset2/single_prediction/albatross1.jpg', target_size = (64, 64)) #second argument is target size
test_image = image.img_to_array(test_image) #allows the model to see the pic with colors/3 dimensions
test_image = np.expand_dims(test_image, axis = 0) #add extra dimension on image specifying batch number so keras doesn't complain
result = classifier.predict(test_image)
if result[0][0] == 1:
    prediction = 'hummingbird'
else:
    prediction = 'albatross'
    
print(prediction)


