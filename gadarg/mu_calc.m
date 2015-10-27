BitsInADC=16;
KKK=6;
AcumLen=BitsInADC*2;
AcumSize=(2^(AcumLen-1));
% after - this is input complex signal of gadarg block

b=[559, 2047, 2047, 1559];
% mu = 1/var(b, 1)/(sum(b.^2)/(length(b)+1)) % размер шага длЯ LMS 
mu = ((1/length(b))/var(after))*var(b)*(2^11)

PS=sum(abs(after).^2)/length(after)
% dt=2^(BitsInADC*2+4)/(PS^2)

RM=1.34*PS/(4*KKK)

step=(2^(AcumLen-1)) * ((2^(BitsInADC*2)+RM)/(PS^2))