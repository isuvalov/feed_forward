function [rett] = big_unsigned2signed(vals,bitlength)
% typecast(uint8(200),'int8')
% dec2bin(mod(x+2^8,2^8),8)  -- signed to unsigned
% typecast(uint8(200),'int8')
maxv=(2^bitlength);
maxv_h=(2^(bitlength-1));
mask=((2^bitlength)-1)*ones(1,length(vals));
smval=bitand(vals,mask);

pos=find(smval>=maxv_h);
smval(pos)=smval(pos)-maxv;
rett=smval;