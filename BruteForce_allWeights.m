function w_mat = BruteForce_allWeights(hist)

% Do SVM training on the histograms for every possible pair of people out of the 40.
    
% Each pair generates a weight vector.
    
% Will end up with 40x40 sets of weight vectors stored into w_mat.

labels = [ones(1,9), - ones(1,9)] ;
    for person_positive = 1:40
        for person_negative = 1:40
            % display where the iteration is at, so that it does not seem
            % like the code is crashing.
            txt = ['Generating weight vector for person No. ',num2str(person_positive),' (+1), and person No. ',num2str(person_negative),' (-1)'];
            disp(txt)
            if person_positive == person_negative
            else
                % Apply the SVM training function.
                w = SVM_train_data([hist(:, 1:9, person_positive),hist(:, 1:9, person_negative)], labels);
                
                % Store and return the weight vectors.
                w_mat(:, person_positive, person_negative) = w;
            end
        end
    end
end