function res=Ml_array(inn,M)
len=floor(M/2);
res=zeros(1,len);
for q=1:len
    res(q)=Ml(inn,q,M);
end