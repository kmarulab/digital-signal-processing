# E71 – Digital Signal Processing  
**Lab 2 – Classification using Frequency Domain Features**

---

## Overview
In this lab, you will explore methods for analyzing and classifying audio signals using frequency-domain techniques. The lab has two main components:

1. **Touchtone Phone Number Recognition**  
2. **Word (“yes” vs. “no”) Recognition**

Throughout both parts of the lab, you will practice partitioning time-domain signals, performing Fourier transforms, extracting relevant features, and using classification methods (such as MATLAB’s `classificationLearner`).

---

## Tasks to Be Done

### Part A – Touchtone Phone Number Recognition
1. **Analyze and Partition the Time-Domain Signal**  
   - Read in `.mp3` audio files containing phone number recordings.  
   - Identify and isolate the segments corresponding to each keypress in the time domain.

2. **Perform Frequency Analysis**  
   - Compute the Fourier transform for each keypress segment.  
   - Identify the two dominant frequencies (Dual-Tone Multi-Frequency, DTMF) present in each segment.

3. **Map Frequencies to Digits**  
   - Use the known DTMF frequency table to determine which digit was pressed for each segment.  
   - Collect all digits and reconstruct the full phone number from each audio file.

4. **Report Results**  
   - Tabulate the two dominant frequencies and the corresponding digit for each keypress.  
   - Present the decoded phone number.  
   - Explain your method, show code snippets, and include relevant plots (time-domain and frequency-domain signals).

### Part B – Word Recognition (“yes” vs. “no”)
1. **Read and Organize the Audio Files**  
   - Unzip and load multiple `.wav` files categorized as “yes” or “no.”  
   - Use a subset of these files (or all, if your computing resources allow) for training and testing.

2. **Extract Features**  
   - Consider various ways to describe audio in the frequency domain (e.g., dividing the spectrum into bins and calculating energy within each bin).  
   - Normalize and assemble these feature values into a single table or array for classification.

3. **Train a Classifier**  
   - Use MATLAB’s `classificationLearner` (or another tool) to train a model on the feature set.  
   - Employ k-fold cross-validation (e.g., 5-fold) to measure performance on training data.

4. **Test and Evaluate**  
   - Classify a separate test set (“yes” or “no”) to obtain a final accuracy measure.  
   - Explore alternative feature extraction methods to potentially improve classification accuracy.

5. **Report Results**  
   - Summarize your approach to feature extraction.  
   - Present training and test accuracy results.  
   - Discuss potential improvements or observations about misclassifications.

---

## Learning Outcomes
By completing this lab, you will:

- **Gain Practical Experience with Frequency-Domain Analysis**  
  Understand how to apply Fourier transforms to real audio signals and interpret the resulting spectra.

- **Learn DTMF (Dual-Tone Multi-Frequency) Basics**  
  Discover how older telephone systems encode digits as pairs of tones and how to decode them.

- **Develop Skills in Signal Segmentation**  
  Learn methods for identifying and isolating distinct signal “bursts” in the time domain.

- **Practice Audio Feature Extraction**  
  Explore various strategies (e.g., spectral energy bins) for converting raw audio data into meaningful numerical features.

- **Use Classification Tools**  
  Gain experience with machine learning classification (such as MATLAB’s `classificationLearner`) to distinguish between different audio classes.

- **Combine Theory and Implementation**  
  Combine digital signal processing concepts with practical coding and data analysis approaches, preparing you for more advanced DSP and machine learning tasks.

---


