NumberQAMbits=4;
fd=50e6;
FreqOffset=0; %0.002;
BitsInADC=16;
datalen=200000*2;
Step=1000*8;
AcumLen=BitsInADC*2;




AcumSize=(2^(AcumLen-1));



qam_size=2^NumberQAMbits;

x = [0:qam_size-1];
A = qammod(x,qam_size);
A=(A./max([real(A) imag(A)]))*2^(BitsInADC-2); % ����� ���������� � �������� ���������� ��������� ��� ���� ���� �������� ����� ��� ����


div_value=2^(AcumLen-1);
div_value2=2^16;
div_value3=2^(AcumLen-1);
c_big=2*floor((mean(abs(A).^4)/(2*mean(abs(A.^2))*mean(abs(A).^2)))*(2^(AcumLen-4)));%*(div_value);




qdB=200; % �/� � ������ ������
kdB=-20; %����������� ������������
q=10^(qdB/20); k=10^(kdB/20);
NS=datalen; % ������ �������� ���������� �������� S1P � S2P
L=7; % ����� �� - ����� ����� � ������� C ������� �������������
dt=0.0041*3;% ��� ���������
 
S1P=zeros(1,NS);
S2P=zeros(1,NS);
KK=zeros(1,NS);
KKK=zeros(1,NS);
R=zeros(1,NS);
PS=zeros(1,NS);
    
     
S1=A(randint(1,datalen,qam_size,100)+1);
t=0:1/fd:15/fd-1/fd;  



HS = [0.2 1 0.4];      
HS=1;

   
SF=conv(S1,HS); %������� ������� ����� ������


SBitsInADC=(2^(BitsInADC-1)-1);
% SBitsInADC=16384;
SF=floor(round(  (SBitsInADC)  *real(SF)./max([real(SF) imag(SF)]))+j*round(  (SBitsInADC)  *imag(SF)./max([real(SF) imag(SF)])));
AS=zeros(1,L);
SF=[AS SF];
SF=[AS SF];
SF=[AS SF];
   save_dat_files;
break;
% SF2=SF; % ������� ��� �������
PS=sum(abs(SF).^2)/NS;  %  This is power of average stardot of signal
RM=1.34*PS;




aaa=SF(1:30);

NS1=NS+L-1 % ����� ������� ������� �������� � ������ ������ L �����
SF1=zeros(L,NS);% ������ L*NS ���� ������� �������� � ������� ��� ���� ����� ��������
for k=1:NS    
    for n=1:L
        SF1(n,k)=SF(n+k-1);
    end
end

I=zeros(1,NS);% ������ 1*1000 ������ �������� 
c=zeros(1,L); % ������ 1*15 ������� ������������� ��
c(round(L/2))=c_big; % ��������� ������� ������������ ������ ��
  
dt=2^(BitsInADC*2+4)/(PS^2); % ��� ���������  Define speed and acurasity of mesure, must be tune value +4
% dt=(3.1954e-018)*2^4*2^(BitsInADC*2)  = 29.47*2^4=471.5578
dt1=dt;

AcumSize_dt1=floor(AcumSize*dt1);
  
kkk_log2=ceil(log2(AcumSize_dt1)/2);
kkk=2^(kkk_log2);

RM=floor(RM/kkk);
RM=RM/4;


N1=NS/100;

SF1=flipdim(SF1,1);
   
cc_re=zeros(NS/Step,L);
cc_im=zeros(NS/Step,L);

vr1=0;
vr2=0;
vr3=0;

vi1=0;
vi2=0;
vi3=0;

cc_re_re=c;
cc_im_im=c;
cc_re_im=c;
cc_im_re=c;

i_vr1=zeros(NS/Step,L);
i_vr2=zeros(NS/Step,1);
i_vr3=zeros(NS/Step,1);

r_vr1=zeros(NS/Step,L);
r_vr2=zeros(NS/Step,1);
r_vr3=zeros(NS/Step,1);

cc_re_re_a=zeros(NS/Step,L);

WR0=zeros(L,1);
WR0_a=zeros(NS/Step,L);
WR_tmp=zeros(L,1);
WR_a=zeros(NS/Step,L);
cre=zeros(L,1);



c_old=c;
for interation=1:2

	cc_re(1,:)=real(c);
	cc_im(1,:)=imag(c);
	tk=2;
 
	for k=6:1:NS
    	if (mod(k-6+8,Step)==0)
			fprintf('k=%i\n',k);
			r_vr1(tk,:)=vr1r;
			r_vr2(tk)=vr2r;
			r_vr3(tk)=vr3r;

			i_vr2(tk)=vi2i;
			i_vr3(tk)=vi3i;

			cc_re_re_a(tk,:)=cc_re_re;

			WR0_a(tk,:)=WR0;

			WR_a(tk,:)=WR_tmp;

			cc_re(tk,:)=real(c);
			cc_im(tk,:)=imag(c);
			cr=double(cc_re);
			subplot(2,1,2)
			mesh(cr); figure(gcf);
			subplot(2,1,1)
			plot(double(I((k-Step/2+1):k)),'.'); figure(gcf);
			tk=tk+1;
    	end;

		az=SF1(:,1:800);
		azz=SF1(:,k);
		I(k)=floor(c*SF1(:,k)./(AcumSize));
	    realIKsq=floor( ((real(I(k))^2)) );
    	imagIKsq=floor( ((imag(I(k))^2)) );
      
		vr1r=floor(AcumSize_dt1*real(SF1(:,k)).');
		vr2r=floor(AcumSize_dt1*real(I(k)));
		vr3r=floor(AcumSize_dt1*( floor(4*realIKsq/kkk) - RM));
		WR0r=floor((vr1r.*vr2r));
		WRr=floor(round(WR0r/floor(AcumSize)).*round(vr3r/floor(AcumSize)));

		vr1i=floor(AcumSize_dt1*imag(SF1(:,k)).');
		vr2i=floor(AcumSize_dt1*real(I(k)));
		vr3i=floor(AcumSize_dt1*( floor(4*realIKsq/kkk) - RM));
		WR0i=floor((vr1i.*vr2i));
		WRi=floor(floor(WR0i/floor(AcumSize/2)).*floor(vr3i/floor(AcumSize/2)));

		vi1r=floor(AcumSize_dt1*real(SF1(:,k)).');
		vi2r=floor(AcumSize_dt1*imag(I(k)));
		vi3r=floor(AcumSize_dt1*( floor(4*imagIKsq/kkk) - RM));
		WI0r=floor((vi1r.*vi2r));
		WIr=floor(floor(WI0r/floor(AcumSize/2)).*floor(vi3r/floor(AcumSize/2)));

		vi1i=floor(AcumSize_dt1*imag(SF1(:,k).'));
		vi2i=floor(AcumSize_dt1*imag(I(k)));
		vi3i=floor(AcumSize_dt1*( floor(4*imagIKsq/kkk) - RM));
		WI0i=floor((vi1i.*vi2i));
		WIi=floor(floor(WI0i/floor(AcumSize/2)).*floor(vi3i/floor(AcumSize/2)));
   
    
    	cc_re_re=(cc_re_re-kkk*WRr);
    	cc_im_im=(cc_im_im+kkk*WIi);    
    
    	cc_im_re=(cc_im_re-kkk*WIr);
    	cc_re_im=(cc_re_im+kkk*WRi);

		c=cc_re_re;
	end
end; % interation



figure;    
   
	subplot(2,1,1)
	hh_f=abs(conv(HS,double(c/(max(c)))));
	stem(hh_f), grid on      
	hh_f(5)=0;
	sum(hh_f.^2)


	subplot(2,1,2);
	sx=real(I)';
    sy=imag(I)';
    plot(double(I((NS-NS/4):NS)),'.');
    plotmatrix(sx(NS/2:NS),sy(NS/2:NS))
    title('SE-����.����� ���.')


