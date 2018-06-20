# Building the CNN

# Importing the Keras libraries and packages
from keras.models import Sequential # Initialize nn
from keras.layers import Convolution2D # 
from keras.layers import MaxPooling2D
from keras.layers import Flatten
from keras.layers import Dense

# Initializing the CNN
classifier = Sequential()

# Convolution
classifier.add(Convolution2D(32, (3, 3), padding='same', input_shape = (64, 64, 3), activation = 'relu')) 
    # Num of filter parameter = num of feature detectors. 
    # Kernal size = size of feature map
    # padding = border_mode, if the feature detector goes past image pixels
    # input shape has 3 channels because there is color in the image
        # blue, green and red. It's not just black and white
        # we're using tensorflow, not theanos. So, input_shape is in a diff order than the example
        #using Relu removes negative pixels in feature map, to get nonlinearity

# Pooling
classifier.add(MaxPooling2D(pool_size = (2, 2)))

# Adding a second convolutional layer
classifier.add(Convolution2D(32, (3, 3), padding='same', activation = 'relu')) 
# Don't need input shape here because keras will know. It's not an initial layer
classifier.add(MaxPooling2D(pool_size = (2, 2)))

# Flattening
classifier.add(Flatten())

# Full connection
classifier.add(Dense(units = 128, activation = 'relu'))
classifier.add(Dense(units = 1, activation = 'sigmoid'))

# Compiling the CNN
classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])

# Fitting the CNN to the images
from keras.preprocessing.image import ImageDataGenerator
train_datagen = ImageDataGenerator(
        rescale=1./255, #pixel values become between 0 and 1 instead of 0 and 255
        shear_range=0.2,
        zoom_range=0.2,
        horizontal_flip=True)

test_datagen = ImageDataGenerator(rescale=1./255)

training_set = train_datagen.flow_from_directory(
        'dataset/training_set',
        target_size=(64, 64),
        batch_size=32,
        class_mode='binary') #for the dependent variable

test_set = test_datagen.flow_from_directory(
        'dataset/test_set',
        target_size=(64, 64),
        batch_size=32,
        class_mode='binary')

classifier.fit_generator(
        training_set,
        steps_per_epoch=8000, #number of images in training set
        epochs=25,
        validation_data=test_set,
        validation_steps=2000, #number of images in test set
        workers = 12,
        max_queue_size = 100) 
    

classifier.save('my_model.h5')
# To load model later, use 'classifier = load_model('my_model.h5')
# And then predict from there

from keras.models import load_model
classifier = load_model('my_model.h5')
# 1) import everything above
# 2) Process the images and create the training/test sets
# 3) load model
# 4) predict

# Making new predictions
import numpy as np
from keras.preprocessing import image
test_image = image.load_img('dataset/single_prediction/albatross.jpg', target_size = (64, 64)) #second argument is target size
test_image = image.img_to_array(test_image) #allows the model to see the pic with colors/3 dimensions
test_image = np.expand_dims(test_image, axis = 0) #add extra dimension on image specifying batch number so keras doesn't complain
result = classifier.predict(test_image)
training_set.class_indices #tells you which label corresponds to which value of the output on the ANN
if result[0][0] == 1:
    prediction = 'albatross'
else:
    prediction = 'hummingbird' # these might be switched
    
print(prediction)
print(result)