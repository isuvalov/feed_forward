Nbit=9;
Nbit_val=(2^(Nbit-1))-2;

N     = 15;   % Order
Fpass = 0.1;  % Passband Frequency
Fstop = 0.2;  % Stopband Frequency
Wpass = 1;    % Passband Weight
Wstop = 80;   % Stopband Weight
dens  = 20;   % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fpass Fstop 1], [1 1 0 0], [Wpass Wstop], {dens});
Hd = dfilt.dffir(b);

filt=Hd.Numerator;
filt=filt/max(abs(filt));
filt=round(Nbit_val*filt);
fvtool(filt)


fprintf('\n:=(');
fprintf('%i,',filt);
fprintf(');\n');