function [res]=int_filt_4tabs(coef,delay_line)

% DDD=(2^(31));
DDD=(2^(16));
% DDD=1;

muls=floor(coef/DDD).'.*delay_line;
sums_1=zeros(1,5);
sums_1(1)=muls(1) + muls(2);
sums_1(2)=muls(3) + muls(4);

sums_2=zeros(1,3);
sums_2(1)=sums_1(1) + sums_1(2);

res=floor(sums_2(1)/DDD);

        if (abs(res)>0) 
%                     fprintf('(%i,%i)\n',real(res),imag(res));
%                     fprintf('(%i,%i)\n',real(res),imag(res));                 
        end;
