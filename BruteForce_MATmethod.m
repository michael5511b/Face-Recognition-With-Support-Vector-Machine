function match = BruteForce_MATmethod(w_mat, hist_test)

% The "Brute Force SVM Matching Matrix Method".

% Multiply each weight vector with the test image.

% This will tell you which person out of each pair the test image is more
% similar to.

% Record the outcomes into the "Brute Force SVM Matching Matrix".

% Add all the positive outcomes in the same row up.

% The row with the most positive outcome will be the matching person!

MAT = zeros(40,40);
for person_positive = 1:40
    for person_negative = 1:40
        W_temp = w_mat(:,person_positive,person_negative);
            
        % Dot product of the weight vector and the histogram, from the
        % product we can determine which of the two people this image
        % is classified to!
        TEST_RESULT = W_temp' * hist_test(:);
        if TEST_RESULT > 1
            % If the match is positive, return the value "1".
            
            % Will generate a 40x40 matrix of classification results of
            % each pair of people.
            MAT(person_positive,person_negative) = 1;
        end
    end
end

for i = 1:40
    % Sum up the amount of times the test image has been classified to each
    % of the 40 people.
    REC(i) = sum(MAT(i,:));
end

% Find out which person the test image has has the most classification to.
[M,Index] = max(REC);

% Return the number of that person.
match = Index; 
end