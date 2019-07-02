%clear all previous input
clear all
clc
close

%load the MATLAB file
load MNIST_digit_data

[img_train_row,img_train_col] = size(images_train);
[lbl_train_row,lbl_train_col] = size(labels_train);

[img_test_row,img_test_col] = size(images_test);
[lbl_test_row,lbl_test_col] = size(labels_test);

k=3;
predctd_label = zeros(lbl_test_row,1);

for i =1:lbl_test_row
    accuracycount=0;
    x = repmat(images_test(i,:),img_train_row,1); 
    dist = sum((x - images_train).^2,2);
    [val , index] = sort(dist,'ascend');
    labeltrain = labels_train(index(1:k));
    predctd_label(i)= mode(labeltrain);
    fprintf('Predicted Data for row %d = %d\n',i,predctd_label(i));
end




