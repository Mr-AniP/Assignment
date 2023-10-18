%% Main script (Question-3)
%%
% Basic Variables
td=0.01; % Time axis jump
ts=10; % Time axis limit
T=0:td:ts; % Time axis
tb=(length(T)-1)*td/20; % seperation between successive transmitted pulses
%% Generation Of Signal
bits=randi([0,1],1,20);
% Generation of Bit stream (of size 20)
% Generation of Output
[si,r,r2]=pulsecooding(T,td,tb,bits,0.5); % for var = 0.5
[si1,r1,r3]=pulsecooding(T,td,tb,bits,2); % for var = 2
%% Ploting of output
figure('Name',"Part-a");
% Part-a
subplot(1,3,1);
plot(T,si);
title("s_i(t)");
grid;
subplot(1,3,2);
stem(T,r2);
title("r(t)");
grid;
subplot(1,3,3);
stem(T,r);
title("rk");
grid;
% Part-b
figure('Name',"Part-b");
plot(T,r2);
hold on;
plot(T,r3);
hold off;
title("r_0_._5(t) (blue) & r_2(t) (red)");
%% Explnation of Part-b
disp("We see that ar variance increases spread in of r(t) inreases");
%% Eye Diagram of signal without noise
eyediagram(si,50);
eyediagram(si1,50);
%% Eye Diagram of signal with noise
eyediagram(r,50);
eyediagram(r1,50);
%% Explnation of Bonus
disp("We see that ar variance increases amplitude in eye diagram inreases");
%% Function to generate output wave forms
function [si,r,r1]=pulsecooding(T,td,tb,bits,sigmasq)
% Logic to generate si(t)
    x=1;
    si=T;
    ak=0;
    for i = 1:length(T)
        m=(i-1)*td/tb;
        s0=2*cos(pi*m);
        if(mod(m*tb,tb)==0 && i~=length(T))
            ak=bits(x);
            x=x+1;  
        end
        si(i)=s0*ak;
    end
    n1= wgn(1,tb*20/td,sigmasq,'linear'); % logic to generate noise
% logic to generate r(t)
    r1=T;
    k=1;
    for i=1:length(T)
        if mod((i-1)*td,td)==0 && i~=length(T)
            r1(i)=si(i)+n1(k);
            k=k+1;
        else
            r1(i)=r1(i-1);
        end
    end
% logic to generate r[k] (we have sampled si(t) and then added noise to it)
    Tsamp=0.02;% 50Hz
    n= wgn(1,tb*20/Tsamp,sigmasq,'linear');% logic to generate noise
    r=T;
    k=1;
    for i=1:length(T)
        if mod((i-1)*td,Tsamp)==0 && i~=length(T)
            r(i)=si(i)+n(k);
            k=k+1;
        else
            r(i)=r(i-1);
        end
    end
end
%% End of the Question