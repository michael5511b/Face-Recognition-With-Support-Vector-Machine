%% GUI setup

% Calls upon a GUI to ask which test image the user want to test.
person_test = GUI3;

%% Run VLFeat

% If the VLFeat SIFT package is not setup yet, set it up.
if exist('vl_sift', 'file') == 0
    run('vlfeat-0.9.20\toolbox\vl_setup');
end

%% Store faces into an array for calling

dir = 'att_faces/';
% Check if the images were saved already.
if ~exist('faces.mat', 'file')
    faces = store_Faces(dir);
    save('faces.mat', 'faces');
else
    load('faces.mat');
end

%% Apply SIFT to every image, generate words used in every image and create a vocabulary

% Check if the "visual words" and "vocabulary" were saved already.
if ~exist('words.mat', 'file')
    % Use SIFT to extract features that we can apply SVM to.
    [words, vocab] = SIFT_word(faces);
    save('words.mat', 'words');
else
    load('words.mat');
end

%% Record the words in every image and generate a histogram for each image

% Histogram is basically a "word count" array.

% Total of 1000 words in the vocabulary, count how many times each word is
% used in the image.

for person = 1:40
    for pic_of_person = 1:9
        for wd = 1:1000
            hist(wd, pic_of_person, person) = sum(words(:,:,person, pic_of_person) == wd);
        end
    end
end

%% Test image histogram generation

if person_test == 41 % If the user chose the "Test all 40 images" option.
    for i = 1:40
        % Test image histogram generation.
        hist_test_all(:,i) = testImg_hist(i, vocab);
    end
else % If the user chose a particular test image.
    % Test image histogram generation.
    hist_test = testImg_hist(person_test, vocab);
end

%% Multiple histogram Brute Force SVM training method

% THIS PART MAY TAKE A WHILE THE FIRST TIME!!!!!

% Check if the weight vectors is saved already.
if ~exist('w_mat.mat', 'file')
    % Do SVM training on the histograms for every possible pair of people out of the 40.
    
    % Each pair generates a weight vector.
    
    % Will end up with 40x40 sets of weight vectors stored into w_mat.
    w_mat = BruteForce_allWeights(hist);
    save('w_mat.mat', 'w_mat');
else
    load('w_mat');
end

%% Brute Force SVM Matching Matrix method

% Multiply each weight vector with the test image.

% This will tell you which person out of each pair the test image is more
% similar to.

% Record the outcomes into the "Brute Force SVM Matching Matrix".

% Add all the positive outcomes in the same row up.

% The row with the most positive outcome will be the matching person!

if person_test == 41 % If the user chose the "Test all 40 images" option.
    for i = 1:40
        match_all(:,i) = BruteForce_MATmethod(w_mat, hist_test_all(:,i));
    end
else % If the user chose a particular test image.
    match = BruteForce_MATmethod(w_mat, hist_test);
end

%% Display Matching Results

if person_test ==41 % If the user chose the "Test all 40 images" option.
    right = 0;
    wrong = 0;
    for i = 1:40
        if match_all(:,i) == i
            % Display test images with correct matches.
            str = ['Test image ',num2str(i), ' has a correct match!'];
            disp(str)
            right = right + 1;
        else
            % Display test images with wrong matches.
            str = ['Test image ',num2str(i), ' has a wrong match!'];
            disp(str)
            wrong = wrong + 1;
        end
    end
    % Display the amount of correct and incorrect matches.
    right_str = ['Number of correct matches: ', num2str(right)];
    wrong_str = ['Number of wrong matches: ', num2str(wrong)];
    disp(right_str)
    disp(wrong_str)
    
else % If the user chose a particular test image.
    figure('rend','painters','pos',[100 100 1200 400])
    % Test image title and results.
    if match == person_test
        str1 = sprintf('Test Image: \n');
        str2 = '{\color{blue}Correct Match!}';
        str = [str1, str2];
    else
        str1 = sprintf('Test Image: \n');
        str2 = '{\color{red}Wrong Match!}';
        str = [str1, str2];
    end
    
    % Display the test image.
    dir_test = ['att_faces/s',num2str(person_test),'/10.pgm'];
    Itest = imread(dir_test);
    subplot(1,10,1), imshow(Itest)
    title(str)
    
    % Display the images from the matched person.
    for i = 1:9
        dir = ['att_faces/s',num2str(match),'/',num2str(i),'.pgm'];
        I_result = imread(dir);
        subplot(1,10,i+1), imshow(I_result)
        txt = ['Match: ',num2str(i)];
        title(txt)
    end
end
