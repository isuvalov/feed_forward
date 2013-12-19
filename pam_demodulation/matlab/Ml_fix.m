function [res,suma]=Ml_fix(inn,l,M,prev_suma)
%zz=inn(l+1:M).*conj(inn(1:M-l));
%res=floor((1/(M-l)).*sum(zz));

% l=1..M/2
%Nbit=16;
%maxCORE=2^(Nbit-1);

suma=0;
for k=l:M
	za=inn(k).*conj(inn(k-l+1));
	suma=suma+za;
end
%res=suma/(M-l);
res=suma;

%  suma=prev_suma;
%  l_prev=l-1;
% %  l_prev=l;
% 
% 	za=inn(l_prev).*conj(inn(1));
% 	suma=suma-za;
% 	za=inn(M).*conj(inn(M-l_prev+1));
% 	suma=suma-za;
%     
%     
% 	za=inn(l).*conj(inn(1));
% 	suma=suma+za;
% 	za=inn(M).*conj(inn(M-l+1));
% 	suma=suma+za;
    
% res=suma/(M-l);