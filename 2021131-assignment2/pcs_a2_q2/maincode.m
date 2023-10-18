%% Main script (Question-2)
%%
T=-0.09:0.0001:0.09; % Time axis
W=-1200:1:1200; % Freq axis
%% Waveforms
% Generating plots for A=Ac=1,PHIc=0,Am=2,1,0.5,fc=1khz,fm=10hz
[v1,v2,a1,u1]=V_AM(1000,10,pi/2,1,1,2,T,W);
[v3,v4,a2,u2]=V_AM(1000,10,pi/2,1,1,1,T,W);
[v5,v6,a3,u3]=V_AM(1000,10,pi/2,1,1,0.5,T,W);
%% Ploting Outputs
figure('Name',"V_AM outputs");
subplot(3,3,1);
plot(T,v1);
title("v1(Time)"); % v1 in time domain
grid;
subplot(3,3,2);
stem(W,real(v2));
title("v1(Freq)(real)");% v1 in frq domain (real part)
grid;
subplot(3,3,3);
stem(W,imag(v2));
title("v1(Freq)(imag)");% v1 in frq domain (imaginary part)
grid;
subplot(3,3,4);
plot(T,v3);
title("v2(Time)"); % v2 in time domain
grid;
subplot(3,3,5);
stem(W,real(v4));
title("v2(Freq)(real)");% v2 in frq domain (real part)
grid;
subplot(3,3,6);
stem(W,imag(v4));
title("v2(Freq)(imag)");% v2 in frq domain (imaginary part)
grid;
subplot(3,3,7);
plot(T,v5);
title("v3(Time)"); % v3 in time domain
grid;
subplot(3,3,8);
stem(W,real(v6));
title("v3(Freq)(real)");% v3 in frq domain (real part)
grid;
subplot(3,3,9);
stem(W,imag(v6));
title("v3(Freq)(imag)");% v3 in frq domain (imaginary part)
grid;
%% Amod and Ac
% Displaying modulation Index and proposed Ac value
disp("--------------------------[ Case-1 ]-------------------------------");
disp("Waveform v1 is defined by A=Ac=1 fc=1KHz fm=10Hz PHIc=0 Am=2");
disp("Modulation index for v1 = "+ a1);
disp(u1);
disp(" ");
disp("--------------------------[ Case-2 ]-------------------------------");
disp("Waveform v2 is defined by A=Ac=1 fc=1KHz fm=10Hz PHIc=0 Am=1");
disp("Modulation index for v2 = "+ a2);
disp(u2);
disp(" ");
disp("--------------------------[ Case-3 ]-------------------------------");
disp("Waveform v3 is defined by A=Ac=1 fc=1KHz fm=10Hz PHIc=0 Am=0.5");
disp("Modulation index for v3 = "+ a3);
disp(u3);
disp(" ");
disp("-----[ End of question-2 (PCS assignment-2) ]-----");
%% End of Question-2
% Please Note -> V_AM()  has seperate report. Thank You