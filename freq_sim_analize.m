setup_freqs=[-1 +0 -0.25 -0.5 -0.75 -1.25 -1.5 -1.75 -2.5  -2 -3.5 -3 -4.5 -4 -5.5 -5 +0.25 +0.5 +0.75 +1.25 +1.5 +1.75 +1 +2.5 +2 +3.5 +3 +4.5 +4 +5.5 +5];

load freqs.dat;
freqs=freqs.';


[a,pos]=sort(setup_freqs);

freqs_scale=(-freqs/max(abs(freqs)))*max(setup_freqs);

plot(setup_freqs(pos))
hold on
plot(freqs_scale(pos),'r')

fprintf('Ошибка как сумма квадратов составляет %4.4f\n',sum((freqs_scale-setup_freqs).^2));