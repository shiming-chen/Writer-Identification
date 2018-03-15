% In this file, we densely extract the feature
% We extract feature from 256,256 image and mirrored image.
% -----Please change the file path in this script. ----
clear;
addpath ..;
netStruct = load('../data/res52_drop0.75_HistoricalWI_binary_E500_F1024/net-epoch-250.mat');
%--------add L2-norm
net = dagnn.DagNN.loadobj(netStruct.net);
net.addLayer('lrn_test',dagnn.LRN('param',[2048,0,1,0.5]),{'pool5'},{'pool5n'},{});
clear netStruct;
net.mode = 'test';
net.move('gpu') ;
net.conserveMemory = true;
im_mean = net.meta(1).normalization.averageImage;
%im_mean = imresize(im_mean,[224,224]);
p = dir('/home/lab535-user1/chenshm/Writer_Ident/data/HistoricalWI_Test_binary_new/*jpg');
ff = [];
%------------------------------
for i = 1:200:numel(p)
    disp(i);
    oim = [];
    str=[];
    for j=1:min(200,numel(p)-i+1)
        str = strcat('/home/lab535-user1/chenshm/Writer_Ident/data/HistoricalWI_Test_binary_new/',p(i+j-1).name);
        imt = imresize(imread(str),[256,256]);
        oim = cat(4,oim,imt);
    end
    f = getFeature2(net,oim,im_mean,'data','pool5n');
    f = sum(sum(f,1),2);
    f2 = getFeature2(net,fliplr(oim),im_mean,'data','pool5n');
    f2 = sum(sum(f2,1),2);
    f = f+f2;
    size4 = size(f,4);
    f = reshape(f,[],size4)';
    s = sqrt(sum(f.^2,2));
    dim = size(f,2);
    s = repmat(s,1,dim);
    f = f./s;
    ff = cat(1,ff,f);
end
save('../test/HistoricalWI_binary_resnet_gallery_new2.mat','ff','-v7.3');
%}

%---------query
p = dir('/home/lab535-user1/chenshm/Writer_Ident/data/HistoricalWI_Query_binary/*jpg');
ff = [];
for i = 1:200:numel(p)
    disp(i);
    oim = [];
    str=[];
    for j=1:min(200,numel(p)-i+1)
        str = strcat('/home/lab535-user1/chenshm/Writer_Ident/data/HistoricalWI_Query_binary/',p(i+j-1).name);
        imt = imresize(imread(str),[256,256]);
        oim = cat(4,oim,imt);
    end
    f = getFeature2(net,oim,im_mean,'data','pool5n');
    f = sum(sum(f,1),2);
    f2 = getFeature2(net,fliplr(oim),im_mean,'data','pool5n');
    f2 = sum(sum(f2,1),2);
    f = f+f2;
    size4 = size(f,4);
    f = reshape(f,[],size4)';
    s = sqrt(sum(f.^2,2));
    dim = size(f,2);
    s = repmat(s,1,dim);
    f = f./s;
    ff = cat(1,ff,f);
end
save('../test/HistoricalWI_bianry_resnet_query_new2.mat','ff','-v7.3');
