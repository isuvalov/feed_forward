function [ret]=find_cync_ce(samples,Period)
%  samples_norm=real(samples)+imag(samples);
 samples_norm=(real(samples));
samples_sq=(samples_norm).^2;
thr=mean(samples_sq)/32;
% plot(samples_sq);
% hold on
% plot(real(samples),'g');
pos=find(reshape(samples_sq,1,[])<thr);
pos_diff_pos=find(diff(pos)<Period);
pos(pos_diff_pos)=[];

% zzz=zeros(1,length(samples_sq));
% zzz(pos)=maxx*ones(1,length(pos));
% plot(zzz,'r');
% plot(thr*ones(1,length(zzz)),'k');


ret=pos+Period;