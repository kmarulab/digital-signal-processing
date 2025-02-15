%*************************************************************************
%   SCRIPT:        Lab1_example_code.m
%
%   DESCRIPTION:   Example of Fourier magnitude spectrum for Lab 1                                 
%
%   COURSE:        ENGR 71 - Digital Signal Processing
%   AUTHOR:        Allan R. Moser    
%   DATE CREATED:  01-Jan-2025
%   LAST CHANGED:  07-Feb-2025
%**************************************************************************
clear    % Clear all variables
close all

% Load sound file
[data, fs] = audioread("StayWithMeTrim.wav");  

% Separate channels 1 and 2 if stereo
ch1 = data(:,1);
ch2 = data(:,2);

% Create vectors for time
tm = (1/fs)*[1:length(data)];
% Plot the time-domain signals
figure(1)
plot(tm,ch1);
% hold on
% plot(tm,ch2);
xlabel('Time (sec)')
ylabel('Magnitude')
title('Channel 1 Sample rate 44.1 kHz (Nyquist 22.05 kHz')
axis tight

% Calculate the Fast Fourier Transform
nsamp = length(ch1);          % Number of samples in signal
fnyquist = fs/2;                   % Nyquist frequency
x_mag = abs(fft(ch1))/nsamp;  % Magnitude of Fourier transform
bins = [0:nsamp-1];                % Create vector for frequencies
freq_hz = bins*fs/nsamp;
% Plot only positive frequencies
n_2 = ceil(nsamp/2);
figure(2)
plot(freq_hz(1:n_2), x_mag(1:n_2))
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Single-sided Magnitude spectrum (Hertz) - Nyquist 22.1 kHz');
axis tight
figure(3)
plot(freq_hz(1:n_2), 10*log10(x_mag(1:n_2)))
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Single-sided Magnitude spectrum (Hertz) - Nyquist 22.1 kHz');
axis tight

% Resample to 8.82 kHz  (by 1/5)
ch1_sub5 = ch1(1:5:end);
fs_sub5 = fs/5;
tm_sub5 = (1/fs_sub5)*[1:length(ch1_sub5)];
figure(4) 
plot(tm_sub5,ch1_sub5);
xlabel('Time (sec)')
ylabel('Magnitude')
title('Channel 1 Sample rate 8.82 kHz (Nyquist 4.41 kHz)')
axis tight
nsamp = length(ch1_sub5);
fnyquist_sub5 = fs_sub5/2;
x_mag = abs(fft(ch1_sub5))/nsamp;
bins = [0:nsamp-1];
freq_hz = bins*fs_sub5/nsamp;
% Plot only positive frequencies
n_2 = ceil(nsamp/2);
figure(5)
plot(freq_hz(1:n_2), x_mag(1:n_2))
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Single-sided Magnitude spectrum (Hertz) - Nyquist 4.41 kHz');
axis tight
figure(6)
plot(freq_hz(1:n_2), 10*log10(x_mag(1:n_2)))
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Single-sided Magnitude spectrum (Hertz) - Nyquist 4.41 kHz');
axis tight