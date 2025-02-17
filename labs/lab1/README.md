# Lab 1 - Aliasing

## Objective
This lab explores how the sample rate affects the frequency content of discrete signals and demonstrates the effects of aliasing when a signal is sampled below the Nyquist rate.

## Overview of Experiment
1. **Loading and Inspecting a Digital Audio File**  
   - A WAV/MP3 file was loaded into MATLAB.  
   - The signal was plotted in the time domain.  

2. **Aliasing Experiments**  
   - The original signal was subsampled at different rates (Fs/5, Fs/10, etc.).  
   - The effects of aliasing were observed through subjective listening tests and time-domain signal visualization.  

3. **Frequency-Domain Analysis**  
   - The Fast Fourier Transform (FFT) was used to examine spectral content at different subsampling rates.  
   - The `signalAnalyzer` tool in MATLAB was used to visualize power spectral densities.  

4. **Anti-Aliasing Filtering**  
   - A low-pass filter was designed using `filterDesigner` to remove frequencies above the Nyquist limit before subsampling.  
   - The filtered and unfiltered subsampled signals were compared to evaluate the effectiveness of the anti-aliasing filter.  

5. **Mystery Sound Analysis**  
   - A provided mystery sound file was analyzed using a specific subsampling rate to uncover hidden audio content.  

## Observations and Key Findings
- Subsampling resulted in audible distortions, demonstrating the impact of aliasing.  
- The frequency content of subsampled signals showed spectral overlap, confirming aliasing effects.  
- Applying a low-pass filter before subsampling preserved the intended signal by eliminating aliasing artifacts.  
- The mystery sound exercise illustrated how aliasing can be creatively exploited to hide information in a signal.  

## MATLAB Commands Used
- `audioread()` – Load audio file  
- `sound()` – Play audio  
- `plot()` – Visualize time-domain signal  
- `fft()` – Compute frequency-domain representation  
- `signalAnalyzer` – Spectral visualization  
- `filterDesigner` – Design anti-aliasing filter  
- `filtfilt()` – Apply filter to signal  

## Conclusion
This lab reinforced key concepts in signal sampling and aliasing. It demonstrated the importance of proper sampling rates and the use of anti-aliasing filters to prevent distortions in digital signal processing applications.
