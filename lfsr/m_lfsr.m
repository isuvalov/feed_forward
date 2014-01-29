function k = m_lfsr(mask,init,n)
mask2=[mask(1:end-1) 0];
reg=init;
k=zeros(1,n);
len=length(mask);

for z=1:n
	a=bitand(reg,mask);
	pp=bitxor(mod(sum(a),2),1);
    k(z)=reg(len);    
 	reg=[reg(2:end) pp];
end
