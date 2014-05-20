function k = m_test_lfsr(inn,mask)
reg=zeros(1,length(mask));
k=zeros(1,length(inn));
len=length(mask);

for z=1:length(inn)    
	a=bitand(reg,mask);
 	reg=[reg(2:end) inn(z)];    
	pp=mod(sum(a),2);
    k(z)=bitxor(inn(z),pp);
end
