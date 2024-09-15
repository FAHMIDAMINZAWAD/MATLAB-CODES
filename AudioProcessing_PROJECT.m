% AudioSignalProcessing.m
% This script implements algorithms for noise reduction, echo cancellation, and audio enhancement.

% Clear workspace and close all figures
clear; close all; clc;

% Read the input audio file
[inputAudio, fs] = audioread('input_audio.wav');
disp('Input audio loaded.');

% Normalize the audio signal
inputAudio = inputAudio / max(abs(inputAudio));

% Plot the original audio signal
figure;
subplot(4, 1, 1);
plot(inputAudio);
title('Original Audio Signal');
xlabel('Sample Number');
ylabel('Amplitude');

% Define noise sample range (assume the first 0.5 seconds is noise)
noiseSampleRange = 1:round(0.5*fs);
noise = inputAudio(noiseSampleRange);

% Compute the noise power spectrum
noisePowerSpectrum = abs(fft(noise, 1024)).^2 / length(noise);

% Perform spectral subtraction
windowLength = 1024;
overlap = 512;
noiseReducedAudio = zeros(size(inputAudio));
numFrames = floor((length(inputAudio) - overlap) / (windowLength - overlap));
window = hamming(windowLength);

for i = 1:numFrames
    startSample = (i-1)*(windowLength - overlap) + 1;
    endSample = startSample + windowLength - 1;
    
    if endSample > length(inputAudio)
        break;
    end
    
    frame = inputAudio(startSample:endSample) .* window;
    
    % Compute the magnitude spectrum of the frame
    spectrum = fft(frame, 1024);
    magnitudeSpectrum = abs(spectrum);
    
    % Perform spectral subtraction
    noisePowerSpectrumFrame = abs(fft(noise, 1024)).^2 / length(noise);
    magnitudeSpectrum = max(magnitudeSpectrum - sqrt(noisePowerSpectrumFrame(1:length(magnitudeSpectrum))), 0);
    
    % Reconstruct the signal
    reconstructedFrame = ifft(magnitudeSpectrum .* exp(1i * angle(spectrum)));
    noiseReducedAudio(startSample:endSample) = noiseReducedAudio(startSample:endSample) + real(reconstructedFrame(1:end));
end

% Normalize the noise-reduced audio
noiseReducedAudio = noiseReducedAudio / max(abs(noiseReducedAudio));

% Plot the noise-reduced audio signal
subplot(4, 1, 2);
plot(noiseReducedAudio);
title('Noise Reduced Audio Signal');
xlabel('Sample Number');
ylabel('Amplitude');

% Generate a simulated echo
echoDelay = round(0.2 * fs); % Echo delay of 0.2 seconds
echoAmplitude = 0.6; % Echo amplitude factor
echoSignal = [zeros(echoDelay, 1); inputAudio(1:end-echoDelay)] * echoAmplitude;

% Combine original signal with echo signal
echoedAudio = inputAudio + echoSignal;

% LMS Adaptive Filter parameters
filterLength = 256;
mu = 0.01; % Step size
adaptiveFilter = dsp.LMSFilter('Length', filterLength, 'StepSize', mu);

% Apply the adaptive filter for echo cancellation
[echoCancelledAudio, ~] = adaptiveFilter(echoSignal, echoedAudio);

% Normalize the echo-cancelled audio
echoCancelledAudio = echoCancelledAudio / max(abs(echoCancelledAudio));

% Plot the echo-cancelled audio signal
subplot(4, 1, 3);
plot(echoCancelledAudio);
title('Echo Cancelled Audio Signal');
xlabel('Sample Number');
ylabel('Amplitude');

% Define the equalizer filter (simple example: boosting high frequencies)
[b, a] = butter(3, 0.7, 'high'); % High-pass Butterworth filter

% Apply the equalizer
enhancedAudio = filter(b, a, noiseReducedAudio);

% Normalize the enhanced audio
enhancedAudio = enhancedAudio / max(abs(enhancedAudio));

% Plot the enhanced audio signal
subplot(4, 1, 4);
plot(enhancedAudio);
title('Enhanced Audio Signal');
xlabel('Sample Number');
ylabel('Amplitude');

% Save noise-reduced audio
audiowrite('noise_reduced_audio.wav', noiseReducedAudio, fs);

% Save echo-cancelled audio
audiowrite('echo_cancelled_audio.wav', echoCancelledAudio, fs);

% Save enhanced audio
audiowrite('enhanced_audio.wav', enhancedAudio, fs);

disp('Processed audio signals saved.');
