load test_im.txt 
load test_re.txt 

%  scatterplot(test_re(end/1.5:end)+1i*test_im(end/1.5:end));
 scatterplot(test_re(end-6000:end)+1i*test_im(end-6000:end));
% scatterplot(test_re+1i*test_im);