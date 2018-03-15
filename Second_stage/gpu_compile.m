addpath matlab;
addpath examples;
run matlab/vl_setupnn ;

vl_compilenn('enableGpu', true, ...
'cudaRoot', '/usr/local/cuda', ...  %put cuda path here 
'cudaMethod', 'nvcc',...
'enableCudnn',true,... 
'cudnnroot','local'); % put cudnn dir path here, which includes two dirs, `include` and `lib64`

warning('off');
