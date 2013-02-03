clc
xp=[0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.5 3 3.5 4 4.5 5 5.5];
yp=[0 -73047 -138593 -204142 -269896 -336000 -401126 -467732 -534641 -667115 -799989 -933041 -1066583 -1200487 -1335678 -1470894];


xm=[0 -0.25 -0.5 -0.75 -1 -1.25 -1.5 -1.75 -2 -2.5 -3 -3.5 -4 -4.5 -5 5.5];
ym=[0 59317 126033 191413 258185 323885 389687 455492 521699 654626 787283 920212 1053794 1188124 1323108 1458722];

k=abs(yp(length(yp)))/(5.5*2*pi*(2^15));

xp_scale=round(xp*k*2*pi*(2^15));
% a=interp1(xp_scale,yp,xp_scale,'cubic');
% a=interp1(xp_scale,yp,1:2^21,'nearest');
% a_inv=interp1(yp/(2^15),xp_scale/(2^15),(1:2^21)/(2^15),'linear');
% a_inv=interp1(yp,xp_scale,(1:2^21),'linear');
a=interp1(yp,xp_scale,0:2^21,'cubic');


n=length(xp);
m=n-1;
pp=polyfit(xp_scale,yp,m); % сразу пытаемся сделать обратную функцию
yin=polyval(pp,0:2^21);




for z=1:length(xp)
    fprintf('Частота %1.1f=%5.5f\n',xp(z), -yin(abs(yp(z)+1))/(2*pi*(2^15)) );
end
% plot(xp_scale,yp);
% hold on;
% plot(xp_scale,a,'r');
% 
% figure;
% plot(diff(a_inv))