NumberQAMbits=4;
fd=50e6;
FreqOffset=0; %0.002;
BitsInADC=16;
datalen=200000*2;
Step=1000*8;
AcumLen=BitsInADC*2;

IT_SCALE=2;


AcumSize=(2^(AcumLen-1));
WorkSize=2^floor(AcumLen/2);



qam_size=2^NumberQAMbits;

x = [0:qam_size-1];
A = qammod(x,qam_size);
A=(A./max([real(A) imag(A)]))*2^(BitsInADC-2); % будем стремиться к половине возможного диапазона для того чтоб оставить место для шума


div_value=2^(AcumLen-1);
div_value2=2^16;
div_value3=2^(AcumLen-1);
c_big=2*floor((mean(abs(A).^4)/(2*mean(abs(A.^2))*mean(abs(A).^2)))*(2^(AcumLen-4)));%*(div_value);




qdB=200; % С/Ш в каждом канале
kdB=-20; %коэффициент просачивания
q=10^(qdB/20); k=10^(kdB/20);
NS=datalen; % размер массивов сигнальных отсчетов S1P и S2P
L=4; % длина ТФ - число ячеек в векторе C весовых коэффициентов
dt=0.0041*3;% шаг адаптации
 
S1P=zeros(1,NS);
S2P=zeros(1,NS);
KK=zeros(1,NS);
KKK=zeros(1,NS);
R=zeros(1,NS);
PS=zeros(1,NS);
    
     
S1=A(randint(1,datalen,qam_size,100)+1);
t=0:1/fd:15/fd-1/fd;  



HS = [0.2 1 0.4];      

   
SF=conv(S1,HS); %отсчеты сигнала после канала


SBitsInADC=(2^(BitsInADC-1)-1);
% SBitsInADC=16384;
SF=floor(round(  (SBitsInADC)  *real(SF)./max([real(SF) imag(SF)]))+j*round(  (SBitsInADC)  *imag(SF)./max([real(SF) imag(SF)])));



AS=zeros(1,L);
SF=[AS SF];
SF=[AS SF];
SF=[AS SF];
%    save_dat_files;
% break;
% SF2=SF; % отсчеты для графика
PS=sum(abs(SF).^2)/NS;  %  This is power of average stardot of signal
RM=1.34*PS;
RM=RM;



aaa=SF(1:30);

NS1=NS+L-1 % длина массива входных отсчетов с учетом первых L нулей
SF1=zeros(L,NS);% массив L*NS всех входных отсчетов в фильтре для всех шагов итераций
for k=1:NS    
    for n=1:L
        SF1(n,k)=SF(n+k-1);
    end
end

I=zeros(1,NS);% массив 1*1000 оценок символов 
c=zeros(1,L); % вектор 1*15 весовых коэффициентов ТФ
% c(round(L/2))=floor(c_big/256); % начальное задание центрального отвода ТФ
%   c(round(L/2)+1)=floor(c_big/256); % начальное задание центрального отвода ТФ
%   c(round(L/2)-1)=floor(c_big/256); % начальное задание центрального отвода ТФ
 c(round(L/2))=floor(AcumSize/256); % начальное задание центрального отвода ТФ
% c=ones(1,L)*floor(AcumSize/256); % начальное задание центрального отвода ТФ
c_def=c;

dt=2^(BitsInADC*2+4)/(PS^2); % шаг адаптации  Define speed and acurasity of mesure, must be tune value +4
% dt=(3.1954e-018)*2^4*2^(BitsInADC*2)  = 29.47*2^4=471.5578
dt1=dt;

AcumSize_dt1=floor(AcumSize*dt1);
  
kkk_log2=ceil(log2(AcumSize_dt1)/2);
kkk=2^(kkk_log2);

RM=floor(RM/kkk);
RM=floor(RM/4);


vhd_val01=floor(AcumSize_dt1*RM/(2^IT_SCALE));
vhd_str=dec2bin(vhd_val01,32);
fprintf('constant RM_STEP:std_logic_vector(FILTER_ACUM_WIDTH-1 downto 0):="%s";\n',vhd_str);

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

SHIFT_N=15;
c_re_shift_array=zeros(SHIFT_N,L);
for z=1:SHIFT_N 
    c_re_shift_array(z,:)=c_def;
end;

%I_work=0;

z_pos=1;
c_old=c;
for interation=1:10

	cc_re(1,:)=real(c);
	cc_im(1,:)=imag(c);
	tk=2;
 
	for k=6:1:NS
    	if (mod(k-6+8,Step)==0)
			fprintf('k=%i\n',k);
			r_vr1(tk,:)=vr1r;
			r_vr2(tk)=vr2r;
			r_vr3(tk)=vr3r;

% 			i_vr2(tk)=vi2i;
% 			i_vr3(tk)=vi3i;

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

   		I(k)=floor(c*SF1(:,k)./(AcumSize));
%         I(k)=int_filt_4tabs(c,SF1(:,k));
        
         
            realIKsq=floor( real(I(k))^2 );
            imagIKsq=floor( imag(I(k))^2 );

            vr1r=floor(AcumSize_dt1*real(SF1(:,k)).');
            vr2r=floor(AcumSize_dt1*real(I(k)));
%            vr3r=floor(AcumSize_dt1*( floor(4*realIKsq/kkk) - RM));
%            vr3r=floor(AcumSize_dt1*( floor(4*realIKsq) - RM*kkk));
%            vr3r=floor(AcumSize_dt1*( floor(4*realIKsq) - (2^20) ));
%             vr3r=floor( floor(realIKsq) - (2^30) );
            vr3r=floor( floor(realIKsq) - RM*4 );
            
            if (abs(vr3r)>2^31)
%                 fprintf('Overflow!\n');
            end;
            
%             vr3r=floor(vr3r/(2^IT_SCALE));
            WR0r=floor(floor(vr1r/WorkSize).*floor(vr2r/WorkSize));
            WRr=floor((2^IT_SCALE)*WR0r*sign(vr3r));  % it comes from:  WRr=floor((2^IT_SCALE)*WR0r*floor(vr3r/floor(AcumSize)));
            WRr_KKK=WRr*kkk;


%         if (mod(z_pos,L)==0)
%         for sz=SHIFT_N:-1:2
%             c_re_shift_array(sz,:)=c_re_shift_array(sz-1,:);
%         end;
%         c_re_shift_array(1,:)=(cc_re_re-WRr_KKK);
             cc_re_re=(cc_re_re-WRr_KKK);                  
%         if (mod(z_pos,20)==0)
%            cc_re_re=c_re_shift_array(SHIFT_N,:);
            c=cc_re_re;
%         end;            
        if (abs(I(k))>0) 
%                        fprintf('(%i,%i)',real(I(k)),imag(I(k)));
        end;
            
%         end;
        z_pos=z_pos+1;
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
    title('SE-созв.после экв.')


