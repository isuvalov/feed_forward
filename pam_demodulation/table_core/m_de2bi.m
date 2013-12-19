function [ret] = m_de2bi(x,size)
x_a=x;
p=find(x<0);
x_a(p)=(2^size)+x(p);
ret=de2bi(x_a,size);