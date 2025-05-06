[y_f, Fs] = audioread('harvard.wav');
y = y_f(:,1);

%Normal Echo
delay_ms = [50 100 200];
echo_sig = y;              
decay    = 0.6;            
for k = 1:numel(delay_ms)
    D       = round(delay_ms(k)*1e-3*Fs);
    b_delay = [zeros(1,D) 1];             
    y_del   = filter(b_delay,1,y);        
    echo_sig = echo_sig + decay*y_del;
end
echo_sig = echo_sig / max(abs(echo_sig));   
% sound(echo_sig,Fs);

%Bouncing Echo
D0      = round(120e-3*Fs); 
nEchoes = 8;                  
alpha   = 0.65;               

b = 1;
for n = 1:nEchoes
    b = [b zeros(1,D0-1) alpha^n];
end
y_bounce = filter(b,1,y);
y_bounce = y_bounce / max(abs(y_bounce));
% sound(y_bounce,Fs); 

%Tempo Echo
bpm = 120;
beat_interval = 60 / bpm; 
delay_times = beat_interval * [1, 2, 3]; 
y_total = y;
for d = delay_times
    delay_samples = round(Fs * d);
    b = [zeros(1, delay_samples), 0.5];
    y_total = y_total + filter(b, 1, y);
end
y_tempo = y_total / max(abs(y_total(:)));
sound(y_tempo,Fs);