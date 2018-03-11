function w = SVM_train_data(X_data, Labels)

% Train the data (the histograms of all the images) with Support Vector
% Machine.

% Other than finding the alpha with complicated methods like SMO, this
% method uses the gradiants of the SVM constraints to gradually shift the
% weights into the right place.

% Since histograms are the record of "number of times each word has been
% used", each word (x-axis) corresponds to a integer value amount (y-axis),
% this type of data seems linearly seperable, so no Kernels needed.

[Ht, Wd , ~] = size(X_data);

% Setup the weight vector matrix
W = zeros(1,Ht);

% How fast the weight values adjusts from each iteration.
learn_rate = 0.005;

% Number of iterations for this SVM algorithm.
iterations = 5;

for i = 1 : iterations
    for k = 1 : Wd
        for j = 1 : Ht
            % The if conditions are derived from the Hinge loss function.
            if Labels(1, k) * (X_data(j, k,1) * W(1,j)) < 1 
                % Misclassification Case
                % If it is a misclassification, we update the weight with
                % the gradients of the weight and the lamda.
                W(1,j) = W(1,j) + learn_rate * ((X_data(j,k,1) * Labels(1, k)) + (-2 * (1/i) * W(1,j)));
            else
                % Correct Case
                % If it is a correct classification, update with only the
                % lamda.
                W(1,j) = W(1,j) + learn_rate * (-2 * (1/i) * W(1,j));
            end
        end
    end    
end

% Return the weight vector.
w = W';
end