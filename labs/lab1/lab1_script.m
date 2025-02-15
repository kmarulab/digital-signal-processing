clear    % Clear all variables
close all

[music, Fs] = audioread("StayWithMeTrim.wav"); %trimmed manually to 42
music_ch1 = music(:,1);
time = (0:length(music_ch1)-1)/Fs;
figure(1)
plot(time,music_ch1);
xlabel('Time (sec)')
ylabel('Magnitude')
title('Channel 1 Sample rate 44.1 kHz (Nyquist 22.05 kHz) Full Sample')
axis tight

figure(2)
%trimming the data to 10s and plotting
music_10s = music_ch1(1:450000);
time_10s = (0:length(music_10s)-1)/Fs;
plot(time_10s,music_10s);
xlabel('Time (sec)');
ylabel('Magnitude');
title('Channel 1 Sample rate 44.1 kHz (Nyquist 22.05 kHz) 10 secs');
axis tight;


%Generated with ChatGPT to Make Plot Generation Easier for more Subplots
% Define the subsampling factors and corresponding titles
subsampleFactors = [5, 15, 25];
titles = {...
    'Channel 1 Sample rate 8.82 kHz (Nyquist 4.41 kHz)', ...
    'Channel 1 Sample rate 2.94 kHz (Nyquist 1.47 kHz)', ...
    'Channel 1 Sample rate 1.764 kHz (Nyquist 0.882 kHz)'};

for k = 1:length(subsampleFactors)
    factor = subsampleFactors(k);
    % Subsample the music signal
    music_sub = music_10s(1:factor:end);
    % Calculate the new sampling frequency and time axis
    Fs_sub = Fs / factor;
    time_sub = (0:length(music_sub)-1) / Fs_sub;
    
    % Plot the subsampled signal
    figure(k+2)
    plot(time_sub, music_sub);
    xlabel('Time (sec)');
    ylabel('Magnitude');
    title(titles{k});
    axis tight;
    
    % To play the sound, uncomment the next line
    % sound(music_sub, Fs_sub)
end