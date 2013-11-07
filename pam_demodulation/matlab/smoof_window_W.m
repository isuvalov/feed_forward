function ret=smoof_window_W(l,N)

ret=2*( N.*((N.^2)-1) - l.*(l-1).*(3*N-2.*l+1)  )./( N.*N.*(N.*N-1) );