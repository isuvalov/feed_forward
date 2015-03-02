function [ret]=farrow_big_filter(in_val,InterpolateRate,mu)

% if (mu<-1)
%   shift_v=abs(floor(mu))-1;  
%   shift_vv=1;
%   shift_vvm=1;  
% elseif (mu>1)
%   shift_v=0;
%   shift_vv=floor(mu);
%   shift_vvm=floor(mu);  
% elseif (mu<0)
%  shift_v=1;
%  shift_vv=1;
%  shift_vvm=1;
% elseif (mu==1) 
%   shift_v=0;
%   shift_vv=2;  
%  shift_vvm=1;  
% else
%   shift_v=0;
%   shift_vv=1;  
%   shift_vvm=1;
% end;

if (mu<-0)
  shift_v=abs(floor(mu));  
  shift_vv=1;
  shift_vvm=1;  

% elseif (mu<0)
%  shift_v=1;
%  shift_vv=1;
%  shift_vvm=1;

else
  shift_v=0;
  shift_vv=floor(mu)+1;  
  shift_vvm=1;
end;

% shift_val=in_val(shift_v+1:end);
mu_f=mu-floor(mu);

fdelay = mu_f; % Fractional delay
d = fdesign.fracdelay(fdelay,'N',10);
Hd_farrow = design(d, 'lagrange', 'FilterStructure', 'farrowfd');

% if (mu_f==0)
%     shift_val_shift=shift_val;
% else
    shift_val_shift=filter(Hd_farrow,in_val);
    shift_val_shift=shift_val_shift(shift_v+1:end);
% end;

 ret=[zeros(1,shift_vv-1) shift_val_shift(1:end)];
% ret=[ zeros(1,shift_v) shift_val_shift(1:end-shift_v) ];
