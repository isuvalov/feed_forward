% load lfsr_2bit.txt
% lfsr_2bit_b=fliplr(de2bi(lfsr_2bit,2));
% a=reshape((lfsr_2bit_b).',1,[]);

clc;

load lfsr_2bit.txt
lfsr_2bit_b=(de2bi(lfsr_2bit,2));
a=reshape((lfsr_2bit_b).',1,[]);

%  bitxor(a(1:100),0)
%  stream = lfsr([1 1 0 0 1], [1 1 1 1], 20)

% stream=m_lfsr([1 1 0 1],[0 0 0 0],60)
% stream=m_lfsr([1 1 0 1],[1 1 1 1],20)
plot(m_test_lfsr(a,[1 0 0 0 0 0 0 0 0 1 1 0 1]))



% [L C] = berlekamp(a(21:40))

% [L C] = berlekamp(bitxor(a(44:60),0))
