function ret=smoof_window_W_fix(l,N,Nbit)

vals=2*( N.*((N.^2)-1) - l.*(l-1).*(3*N-2.*l+1)  )./( N.*N.*(N.*N-1) );

ret=round(((2^(Nbit-1))-1)*vals/max(abs(vals)));