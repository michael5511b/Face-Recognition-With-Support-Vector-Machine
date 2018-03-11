# Face Recognition With Support Vector Machine (Project for Machine Learning Course)
- Name: Michael Cheng

- Programming Language: MATLAB

- OS: Windows

## Instructions:
1) Start with opening and running the "main.m" file in the folder. 

2) A GUI window will appear with all the test images labeled with a number, 
choose a test image or select "Test all 40 images!" to check the overall performance.

3) If this is your first time running the code, it will take a while as it is generating the vocabulary,
forming histograms, and performing the Brute Force Method. You will see the iteration notices during 
the Brute Force Method.

4) Variables such as the images, words, vocabulary and weight functions will be saved after the first run,
making the code run much faster afterwards.

5) If you chose a specific test image at the start, the program will show the images that matches the test image.
If you chose to test all 40, the results will show in the command window.

NOTE: If there are errors saying "vocab" not found delete all the pre-existing ".mat" files in the folder and try again.



## CODE CONSTRUCTION:
1.	GUI Setup:
The program starts with a GUI window with all the test images displayed and numbered. The user can pick one test 
image or choose to test all 40 test images at once and check the performance. 

2.	Store Face Image:
Store all the image in the data base to an array, labeling the person and the number of the image of that person. 
 
3.	Generate “Words” and “Vocabulary”:
This stage utilizes the VLFeat package. First, use the "dense SIFT" function to get the descriptors features across 
the whole image uniformly (Normal SIFT will pick the feature it likes, we don't want that). Store all the descriptors 
of all the images, then apply K-means clustering, setting K = 1000. Each cluster can be viewed as a “visual word”, 
and these 1000 words make up the “vocabulary”. With the vocabulary and the decision tree of each word, we can go back 
to each image and observe which words from the vocabulary were used in each image. 

4.	Histogram:
The histogram of an image is basically a word count of the image. It store how many times each word out of the 1000 word 
vocabulary is used in this image. Histogram is a great feature format to apply SVM. Also, generate the histogram for the 
test images.

5.	SVM Data Training:
Rather than using complex methods like SMO to find the alpha values to generate the weights, the method I use for SVM data
training is to use the gradients of the Hinge loss function, accompanied with the basic law/constraint of the classifying 
function to “move” the weights gradually to the right direction. I make the algorithm run for 5 iterations with a 
learning rate value of 0.005. 

6.	Brute Force Method:
As the name sounds, this is utilizing fast computers at its best. I run SVM data training for each possible pair of people 
out of the 40. Every pair of SVM training will generate a set of weights for test image classification. This means we will 
have 40x40 weight vectors generated. The dot product of the weights and the histogram of the test image will show which 
person of the pair the image is more similar to. Record all the 40x40 outcome results and sum up the amount of time the 
image has been classified to each person, the person with the most classification count is the match. 

7.	Display Results:
Show if the match is correct.
