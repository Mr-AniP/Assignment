%% Main Script (Question-1)
%% Calling Test_vdsb() and generating waveforms
[v1,v2,v3]=test_vdsb(); % Output Waveforms are being obtained
% Making Time axis
T=-0.09:0.0001:0.09;
%% Demodulating the given signals with phir=pi/2
[st11,sf11,f1]=Demod_VDSB(v1,pi/2,1000,T);
[st21,sf21,f2]=Demod_VDSB(v2,pi/2,1000,T);
[st31,sf31,f3]=Demod_VDSB(v3,pi/2,1000,T);
%% Demodulating the given signals with phir=0
[st12,sf12,f4]=Demod_VDSB(v1,0,1000,T);
[st22,sf22,f5]=Demod_VDSB(v2,0,1000,T);
[st32,sf32,f6]=Demod_VDSB(v3,0,1000,T);
%% Ploting the demodulated signals for phir=pi/2
figure('Name',"PHIr = pi/2");
subplot(3,3,1);
plot(T,st11);
title("m1(Time)");
grid;
subplot(3,3,2);
stem(f1,real(sf11));
title("m1(Freq)(real)");
grid;
subplot(3,3,3);
stem(f1,imag(sf11));
title("m1(Freq)(imag)");
grid;
subplot(3,3,4);
plot(T,st21);
title("m2(Time)");
grid;
subplot(3,3,5);
stem(f2,real(sf21));
title("m2(Freq)(real)");
grid;
subplot(3,3,6);
stem(f2,imag(sf21));
title("m2(Freq)(imag)");
grid;
subplot(3,3,7);
plot(T,st31);
title("m3(Time)");
grid;
subplot(3,3,8);
stem(f3,real(sf31));
title("m3(Freq)(real)");
grid;
subplot(3,3,9);
stem(f3,imag(sf31));
title("m3(Freq)(imag)");
grid;
%% Ploting the demodulated signals for phir=0
figure('Name',"PHIr = 0");
subplot(3,3,1);
plot(T,st12);
title("m1(Time)");
grid;
subplot(3,3,2);
stem(f4,real(sf12));
title("m1(Freq)(real)");
grid;
subplot(3,3,3);
stem(f4,imag(sf12));
title("m1(Freq)(imag)");
grid;
subplot(3,3,4);
plot(T,st22);
title("m2(Time)");
grid;
subplot(3,3,5);
stem(f5,real(sf22));
title("m2(Freq)(real)");
grid;
subplot(3,3,6);
stem(f5,imag(sf22));
title("m2(Freq)(imag)");
grid;
subplot(3,3,7);
plot(T,st32);
title("m3(Time)");
grid;
subplot(3,3,8);
stem(f6,real(sf32));
title("m3(Freq)(real)");
grid;
subplot(3,3,9);
stem(f6,imag(sf32));
title("m3(Freq)(imag)");
grid;
%% Function to demodulate our vdsb signal
    % concept is -> 
    % ns=vdsb *2cos(2pifct+phir) and filtering it  at cutoff =100Hz
function [st,sf,f]=Demod_VDSB(v,PHIr,fc,t)
    ns=2.*v.*cos(PHIr+(2*pi*fc.*t)); % generating ns
    st=lowpass(ns,100,1e3); % low pass filter to filter the ns signal at cutoff=100Hz
    sf=fftshift(fft(st)); % filtered signal in freq domain
    f = ((0:length(sf)-1)*10000/(length(sf)))-5000; % freq axis
end
%% End of the Question-1
% Please Note -> test-VDSB()  has seperate report. Thank You