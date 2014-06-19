function [rett] = intcomplex_mul(a,b,c,d,conj_it,shift)
% (a,b)*(c,d)
N=16;
ac=a*c;
ad=a*d;
bc=b*c;
bd=b*d;

if (conj_it==0)
	ACmBD=floor(ac*(2^shift)/(2^N))-floor(bd*(2^shift)/(2^N));
    ADpBC=floor(ad*(2^shift)/(2^N))+floor(bc*(2^shift)/(2^N));
	rett=floor(ACmBD/2)+1i*floor(ADpBC/2);
else
	ACpBD=floor(ac*(2^shift)/(2^N))+floor(bd*(2^shift)/(2^N));
    BCmAD=floor(bc*(2^shift)/(2^N))-floor(ad*(2^shift)/(2^N));
	rett=floor(ACpBD/2)+1i*floor(BCmAD/2);
end
if isnan(rett)
    fprintf('here');
end;





