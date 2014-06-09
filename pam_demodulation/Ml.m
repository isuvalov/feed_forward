function res=Ml(inn,l,M)
zz=inn(l+1:M).*conj(inn(1:M-l));
res=(1/(M-l)).*sum(zz);