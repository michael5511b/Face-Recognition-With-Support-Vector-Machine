function faces = store_Faces(directory)
% Store all the images into an array.

% Each image labeled by the number of the person, and which image of the
% person.

% Only store 9 images of each person, leaving one as the test image.

for person = 1:40
    for pic_of_person = 1:9
        str = [directory,'s',int2str(person),'\',int2str(pic_of_person),'.pgm'];
        I = imread(str);
        if( size(I,1) > 400 )
            img = imresize(I,[200, 200]);
        end
        faces(:,:,person, pic_of_person) = I(:,:);
    end
end
end