function [word_img, vocab] = SIFT_word(faces)
% Utilize the VLFeat package for SIFT functions.

% Use the "dense SIFT" function to get the descriptors features across the
% whole image uniformly (Normal SIFT will pick the feature it likes, we don't want that).

% Store all the feature descriptors of all images.

% Apply K-means clustering to all the descriptors, set K to 1000 clusters,
% each cluster can be seen as a "visual word".

% These 1000 visual words altogether is the "vocabulary".

% With the vocaulary and decsion tree of each word (from vl_kdtreebuild),
% we can go back to each image and see which words from the vocabulary are
% used in each image and where the word is used on the image. 

% Return an array of the words used in each image and the whole vocaulary
% to the main program.

numOfWords = 1000; % Number of words desired in the vocabulary.

[~,~,p,pop] = size(faces);
descriptors = cell(p,pop) ;

for person = 1:p
    for pic_of_person = 1:pop
        % Convert each image to single.
        I = faces(:,:,person, pic_of_person);
        I = single(I);

        % Get the keypoints and discriptors of the features from each image.
        [KP, D] = vl_phow(I, 'step', 4, 'floatdescriptors', true);
        
        % Store Info
        % Though we don't need the location of the features, it may come in
        % handy some day!
        keypoints(:,:,person, pic_of_person) = KP;
        
        % Pick 200 random descriptors for each image, or it will be too
        % much info!
        descriptors{person, pic_of_person} = vl_colsubset(D, 200, 'uniform'); 
    end
end

% This is generating the whole vocabulary from all the image
descript_single = single([descriptors{:,:}]) ;
vocab.words = vl_kmeans(descript_single, numOfWords, 'verbose', 'algorithm', 'elkan') ;
vocab.tree = vl_kdtreebuild(vocab.words) ;

% This is looking at each image and distinguishing which words are used in
% the image and where.
hist_array = cell(p,pop);
for person = 1:p
    for pic_of_person = 1:pop
        % Convert each image to single.
        I = faces(:,:,person, pic_of_person);
        I = single(I);
        
        % Get the descriptors of that image.
        [keypoints, D] = vl_phow(I, 'step', 4, 'floatdescriptors', true);
        
        % Use vl_kdtreequery to find which word from the whole vocaulary is
        % the closest to the discriptors of the current image 
        [words, dist] = vl_kdtreequery(vocab.tree, vocab.words, D, 'MaxComparisons', 15);
        
        % Store the words info for all images
        word_img(:,:,person, pic_of_person) = double(words) ;
    end
end

end

