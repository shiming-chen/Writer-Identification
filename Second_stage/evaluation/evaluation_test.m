test_dir = 'D:/Market-1501-v15.09.15/Market-1501-v15.09.15/bounding_box_test/';
test_files = dir([test_dir '*.jpg']);
testID = zeros(length(test_files), 1);
mkdir('./data_test')

if ~exist('data_test/testID.mat')
    for n = 1:5
        img_name = test_files(n).name;
        test_label=strcat(img_name,'_');
        fprintf(test_label(1));
        %testID(n) = str2num(img_name(1:4));
        % if strcmp(img_name(1), '-') % junk images
            % testID(n) = -1;
            % testCAM(n) = str2num(img_name(5));
        % else
            % %img_name
            % testID(n) = str2num(img_name(1:4));
            % testCAM(n) = str2num(img_name(7));
        % end
    end
    save('data_test/testID_new.mat', 'testID');
    %save('data/testCAM.mat', 'testCAM');
else
    testID = importdata('data_test/testID_new.mat');
    %testCAM = importdata('data/testCAM.mat');    
end
