function [res]=int_filt_8tabs(coef,delay_line)

% DDD=(2^(31));
DDD=(2^(16));
% DDD=1;

muls=floor(coef/DDD).'.*delay_line;
sums_1=zeros(1,5);
sums_1(1)=muls(1) + muls(2);
sums_1(2)=muls(3) + muls(4);
sums_1(3)=muls(5) + muls(6);
sums_1(4)=muls(7) + muls(8);

sums_2=zeros(1,3);
sums_2(1)=sums_1(1) + sums_1(2);
sums_2(2)=sums_1(3) + sums_1(4);

sums_3=zeros(1,2);
sums_3(1)=sums_2(1) + sums_2(2);

res=floor(sums_3(1)/DDD);

        if (abs(res)>0) 
%                     fprintf('(%i,%i)\n',real(res),imag(res));
%                     fprintf('(%i,%i)\n',real(res),imag(res));                 
        end;
