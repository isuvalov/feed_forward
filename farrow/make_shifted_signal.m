% clc
% (2950.032-2950.172)/2950.032=-4.74571123296289336E-0005  - all is bad
% (2952.032-2950.032)/2950.032 = 6.77958747566128096E-0004 - need 2���


BERs=3:20;
BERs=300;
rats_array=[];
fd=200;      % �������� ������� ���/���
% pilot_len=250;  % ����� �������� �� �������� ������������ ���������� � �����
pilot_len=64;  % ����� �������� �� �������� ������������ ���������� � �����
InterpolateRate=4;
PilotsNum=1; % ���������� ������ � �������� ��� ��������� ������� 
tdelay=100000;        % ����� ��������� ���������� ������� ����� ����� ���������
% tlen=PilotsNum*(2*tdelay+pilot_len*InterpolateRate); %201000; % ����� ���� ��������
tlen=(PilotsNum)*(tdelay+pilot_len); %201000; % ����� ���� ��������
alpha1=0.001;      % ����������� ����������, ��� �� ������ ��� ������ ����������
alpha2=0.1;
 FreqOffset=0.5;
  FreqOffset=0.000;
test_freq_d=0.00;
M=4;
FILTLEN=32;
R=0.2;
 R=1;

mod_engine=modem.pskmod('M',M,'PhaseOffset', pi/4);
demod_engine=modem.pskdemod('M',M,'PhaseOffset', pi/4);

fdelay = 0.5; % Fractional delay
d = fdesign.fracdelay(fdelay,'N',3);
Hd_farrow = design(d, 'lagrange', 'FilterStructure', 'farrowfd');


Fi_porog=abs(angle(modulate(mod_engine,0))-angle(modulate(mod_engine,1)))/2;


N=floor(tlen/(tdelay+pilot_len));

T=InterpolateRate/2; % �.�. ������� ����� ������� fd/InterpolateRate

t=(-9:1/T:9);
%% SQRT Raised Cosine
hsqrt=4*R*(  cos((1+R)*pi.*t/T) + sin((1-R).*pi.*t/T)./(4*R.*t/T)  ) ./ (pi*sqrt(T).*(1-(4*R.*t/T).*(4*R.*t/T)) ); % sqrt SQRT Raised Cosine
hsqrt_max=(pi+4*R-pi*R)/(pi*sqrt(T));
hsqrt=hsqrt./hsqrt_max;
hsqrt(round(length(hsqrt)/2))=1;
% hsqrt(14)=-0.1888; % ��������� ��� R=0.2, InterpolateRate=4
% hsqrt(24)=-0.1888; % ��������� ��� R=0.2, InterpolateRate=4
hsqrt(17)=-0.1888; % ��������� ��� R=0.2, InterpolateRate=8
hsqrt(57)=-0.1888; % ��������� ��� R=0.2, InterpolateRate=8


  hsqrt=firrcos(32 + mod(32,2),1/InterpolateRate,R,2,'rolloff','sqrt',(32 + mod(32,2))/2,boxcar(32 + mod(32,2)+1));
  
  hsqrt_sq=firrcos(32 + mod(32,2),1/InterpolateRate,R,2,'rolloff');
  
  
  half_filter=firrcos(32 + mod(32,2),1/2,1,2,'rolloff');
  
  
%  hsqrt=firrcos(32 + mod(32,2),1/InterpolateRate,1,2,'rolloff','sqrt',(32 + mod(32,2))/2,boxcar(32 + mod(32,2)+1));  %was

% hsqrt=sinc(t/T).*( cos(pi*R*t/T) ) ./ ( 1-4*R*R.*t.*t./(T*T) );  % normal Raised Cosine
% hsqrt=hsqrt/max(hsqrt);
% hsqrt_one=[zeros(1,floor(length(hsqrt)/2)) 100 zeros(1,floor(length(hsqrt)/2)+1)];
% hsqrt_one=hsqrt_one(1:length(hsqrt));
hsqrt_one=hsqrt;

%% Make pilot symbol
some=reshape(hadamard(2^ceil(log2(sqrt(pilot_len)))),1,[]);   % ����������� �����-�� ������ �� +/-1
pilot=some(1:pilot_len)+1i*some(1:pilot_len);


s_transfer=[];
values_all=[];
BERval=BERs;
%% Transimeter ������ ������� �� ���������� �������
x=[];
for z=1:N
    if tdelay>0
%         values=randint(1,tdelay,M);
         values=randi(M,1,tdelay)-1;

		values_all=[values_all values];
        x=modulate(mod_engine,values); % ��������� PAM
    end
	s_transfer=[s_transfer pilot x];
end
%  s_transfer=[pilot modulate(mod_engine,repmat([1 0 1 0 1 0 1 0 ],1,floor(tdelay/8)))];
%             s_transfer=[pilot modulate(mod_engine,repmat([0 1 2 3 0 1 2 3],1,floor(tdelay/8)))];
%  s_transfer=[pilot modulate(mod_engine,repmat([0 6 2 4 3 5 1 7],1,floor(tdelay/8)))];


s_transfer_filt1=zeros(1,length(s_transfer)*InterpolateRate);
s_transfer_filt1(1:InterpolateRate:end)=s_transfer;  % ����������� ������ ��� �����������
s_transfer_filt1=conv(s_transfer_filt1,hsqrt); % ����������� ������
s_transfer_filt1=s_transfer_filt1(floor(length(hsqrt)/2):end-floor(length(hsqrt)/2));


pilotUP=zeros(1,length(pilot)*InterpolateRate);
pilotUP(1:InterpolateRate:end)=pilot;
pilotUP=conv(pilotUP,hsqrt);
cut_f_l=floor(length(hsqrt)/2);
pilotUP=pilotUP(cut_f_l:end-cut_f_l-1); % ����������� ������ �� ��������
pilotUP=conv(pilotUP,hsqrt);
pilotUP=pilotUP(cut_f_l:end-cut_f_l-1); % ����������� ������ �� ������
%%%%%%%%
% ������ ���� pilotUP_n*conj(pilotUP_n).'==1
%   ������� ���������� pilotUP !!!!!!!!!!!!!!!
%%%%%%%%
% pilotUP=pilotUP./norm(pilotUP);



tlen=length(s_transfer_filt1);
t3=0:1/fd:tlen/fd-1/fd;

tframelen=(pilot_len+tdelay)*InterpolateRate;
t4=0:1/fd:tframelen/fd-1/fd;

%% Chanell ��������� �������� ��� � ����� �� �������
    % ��� ��������� ������� ���� �� ������ -90dB
%  	rx_transfer=s_transfer_filt1.*exp(1i*t3*FreqOffset*2*pi+(0.1/fd)*randn(1,length(s_transfer_filt1)));
rx_transfer=s_transfer_filt1;%.*exp(1i*t3*FreqOffset*2*pi);      
%  rx_transfer=rx_transfer.*exp(1i*pi/8);
 	rx_transfer = awgn(rx_transfer,BERval,'measured');  





%% Receiver  �����

rx_transfer_filt=conv(rx_transfer,hsqrt_one); % ������ �� ������
rx_transfer_filt=rx_transfer_filt(cut_f_l:end-cut_f_l);
rx_transfer_filt=rx_transfer_filt./max(real(rx_transfer_filt));

rx_transfer_filt=[rx_transfer_filt];


rx_transfer_filt_shift=filter(Hd_farrow,rx_transfer_filt);
rx_transfer_filt_shift=rx_transfer_filt_shift(2:end);

maxofs=max([real(rx_transfer_filt_shift) imag(rx_transfer_filt_shift)]);

rx_real=round(real(rx_transfer_filt_shift/maxofs)*32767);
rx_imag=round(imag(rx_transfer_filt_shift/maxofs)*32767);

fid = fopen('before_farrow_i.txt','w');
fprintf(fid,'%i\n',rx_real);
fclose(fid);

fid = fopen('before_farrow_q.txt','w');
fprintf(fid,'%i\n',rx_imag);
fclose(fid);

