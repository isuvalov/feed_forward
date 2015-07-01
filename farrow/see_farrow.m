load after_farrow_i.txt
load after_farrow_q.txt

after_farrow=after_farrow_i+1i*after_farrow_q;

scatterplot(after_farrow(floor(7*end/8):1:end))

%%
% load before_farrow_i.txt 
% load before_farrow_q.txt 
% 
% before_farrow=before_farrow_i+1i*before_farrow_q;
% scatterplot(before_farrow(floor(3*end/4):InterpolateRate:end))

load bafter_farrow_i.txt
load bafter_farrow_q.txt

after_farrow=bafter_farrow_i+1i*bafter_farrow_q;

scatterplot(after_farrow(floor(7*end/8):1:end))