%%

load ../gadarg_frame_I.txt
load ../gadarg_frame_Q.txt

   scatterplot(gadarg_frame_I(end/1.5:end)+1i*gadarg_frame_Q(end/1.5:end));
%  scatterplot(gadarg_frame_I(end-6000:end)+1i*gadarg_frame_Q(end-6000:end));
% scatterplot(gadarg_frame_I(end-4000:end)+1i*gadarg_frame_Q(end-4000:end));
% scatterplot(gadarg_frame_I(end/1.5+1e4:end/1.5+1.7e4)+1i*gadarg_frame_Q(end/1.5+1e4:end/1.5+1.7e4))

% scatterplot(gadarg_frame_I(end-6000:end-5000)+1i*gadarg_frame_Q(end-6000:end-5000));

%%

% load test_im.txt 
% load test_re.txt 

%  scatterplot(test_re(end/1.5:end)+1i*test_im(end/1.5:end));
%  scatterplot(test_re(end-6000:end)+1i*test_im(end-6000:end));
% scatterplot(test_re+1i*test_im);