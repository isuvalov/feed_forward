function [ret,farrow_a_out]=farrow_loop(in_val,farrow_a,mu)
%  farrow_a is delayline that init like farrow_a=zeros(4,1);

    farrow_a=[in_val; farrow_a(1:3)];
    farrow_a_out=farrow_a;
    farrow_m1=farrow_a.*([1/6 -1/2 1/2 -1/6].'*(1));
    farrow_m2=farrow_a.*([0 1/2 -1 1/2].');
    farrow_m3=farrow_a.*([-1/6 1 -1/2 -1/3].');
    farrow_m4=farrow_a.*([0 0 1 0].');
    
    f01=sum(farrow_m1)*mu;
    f02=(sum(farrow_m2)+f01)*mu;
    f03=(sum(farrow_m3)+f02)*mu;
    f04=(sum(farrow_m4)+f03)*mu;


ret=f04;
