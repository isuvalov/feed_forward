function [res]=int_filt_8tabs(coef,delay_line)

DDD=(2^31);

muls=coef.'.*delay_line;
sums_1=zeros(1,5);
sums_1(1)=floor(muls(1)/DDD) + floor(muls(2)/DDD);
sums_1(2)=floor(muls(3)/DDD) + floor(muls(4)/DDD);
sums_1(3)=floor(muls(5)/DDD) + floor(muls(6)/DDD);
sums_1(4)=floor(muls(7)/DDD) + floor(muls(7)/DDD);
sums_1(5)=floor(muls(8)/DDD);

sums_2=zeros(1,3);
sums_2(1)=sums_1(1) + sums_1(2);
sums_2(2)=sums_1(3) + sums_1(4);
sums_2(3)=sums_1(5);

sums_3=zeros(1,2);
sums_3(1)=sums_2(1) + sums_2(2);
sums_3(2)=sums_2(3);

res=sums_3(1)+sums_3(2);
