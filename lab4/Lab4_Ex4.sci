// Clear old scripts
clc;
close;
clear;

// Audio file directory
dir = "C:\Users\dinhh\Documents\University\HK261\CO2035\Labs\sci\lab4\SampleAudio_StartFresh_30sec.wav";

// Play audio file 
playsnd(dir);

// Load audio file
audio = wavread(dir);

// Plot audio signal in frequency domain
analyze(audio);
title('Frequency domain analysis');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

// Display amplitude (time)
mapsound(audio);

// lin2mu and mu2lin
audio_channel = audio(1, :);
mu_channel = lin2mu(audio_channel);
audio_channel_reverse = mu2lin(mu_channel);

atomsGUI();
