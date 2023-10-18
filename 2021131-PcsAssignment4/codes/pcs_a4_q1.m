%% Main script (Question-1)
%% 
% Basic Variables
L=16; % L = Quantization levels
td=0.01; % td = jump in time
T=0:td:3; % Time axis
x=(5.*(sin(T)).^2) +(4.*cos(T)); % x(t) Function
%% Sampling
Ts=0.05;
% Niquest Rate of Sampling is 2/pi
% So I choose fs = 20Hz or ts=0.05
x_samp=T;
for i=1:length(T)
    if mod((i-1),Ts/td)==0
        x_samp(i)=x(i); % Data is been stored at Sampled Point in Output
    else
        x_samp(i)=x_samp(i-1); % Retaining The Output
    end
end
%% Quantization Logic
x_sampmax=max(x_samp);
x_sampmin=min(x_samp);

Quant_interval=(x_sampmax-x_sampmin)/L;
% This is Quantization  Interval or Delta

qs=min(round((1/2)+((x_samp-x_sampmin)/Quant_interval)),L);
% Calculation of Quantization level at the sampled points of x(t)

x_quantized=(x_sampmin)+ (qs-0.5)*(Quant_interval);
% This is the Quantized Signal
%% Ploting of Results
figure('Name',"plot-1");
plot(T,x);
title("x(t)");
figure('Name',"plot-2")
plot(T,x);
hold on;
plot(T,x_quantized);
hold off;
title("x(t) (blue) & Quantized Signal (red)");
%% Output of the Quantizer as A Matrix
display(x_quantized);
%% Dimension Of The Matrix
display(size(x_quantized));
%% End of the Code
