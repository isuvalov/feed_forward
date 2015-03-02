%%

load ../gadarg_frame_I.txt
load ../gadarg_frame_Q.txt

%  scatterplot(gadarg_frame_I(end/1.5:end)+1i*gadarg_frame_Q(end/1.5:end));
 scatterplot(gadarg_frame_I(end-6000:end)+1i*gadarg_frame_Q(end-6000:end));
%  scatterplot(gadarg_frame_I(end-1000:end)+1i*gadarg_frame_Q(end-1000:end));


%%

% load test_im.txt 
% load test_re.txt 
% 
% %  scatterplot(test_re(end/1.5:end)+1i*test_im(end/1.5:end));
%  scatterplot(test_re(end-6000:end)+1i*test_im(end-6000:end));
% scatterplot(test_re+1i*test_im);