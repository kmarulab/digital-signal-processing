%------------------------------------------
% Example 1 
%  Simple FIR filter
%  y[n] = (1/3)*(x[n] + x[n-1] + x[n-2])
%------------------------------------------
clear
close all
load mitdb_data.mat
fs = double(Fs);
ecg1 = ecg{1}(:,1);
Ts = 1/fs;
tm = [0:Ts:(length(ecg1)-1)*Ts];
figure(1)
plot(tm,ecg1)
indx = find(tm >=13 & tm <=17);
sig = ecg1(indx);
t = [0:Ts:(length(sig)-1)*Ts];
figure(2)
plot(t,sig)
% pause;
a = [3 0 0];
b = [1 1 1];
figure(3)
impz(b,a)
figure(4)
freqz(b,a,100*fs)
figure(5)
[hhw,ww] = freqz(b,a,100*fs);
plot(ww,abs(hhw));
figure(6)
[hhf,ff] = freqz(b,a,100*fs,fs);
plot(ff,abs(hhf))
figure(7)
% pzmap(b,a)
zplane(b,a);
fsig = filter(b,a,sig);
ffsig = filtfilt(b,a,sig);
figure(8)
plot(t,sig);
hold on
plot(t,fsig,'r');
plot(t,ffsig,'g');
legend('original signal','filt signal','filtfilt signal')