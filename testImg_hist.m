function hist_test = testImg_hist(person, vocab)

% Generates the histogram for the test image.

% Same concept as the SIFT_word function and the histogram generation part
% in the main function.

dir = ['att_faces\s',num2str(person),'\10.pgm'];
Itest = imread(dir);
Itest = single(Itest);
[keypoints, D] = vl_phow(Itest, 'step', 4, 'floatdescriptors', true);
[words_test, dist] = vl_kdtreequery(vocab.tree, vocab.words, D, 'MaxComparisons', 15);

for j = 1:1000
    hist_test(j) = sum(words_test(:,:) == j);
end

end