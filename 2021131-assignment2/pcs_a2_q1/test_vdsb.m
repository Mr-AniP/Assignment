%% Test script (Question-1)
%% Function to Test V_DSB()
% _test_vdsb()_ is the function to test V_DSB() for values of
% A=1,PHIc=pi/2,Am=2,1,0.5,fc=1khz,fm=10hz
function [v1,v3,v5]=test_vdsb() % Function to test vdsb
    T=-0.09:0.0001:0.09; % Time axis
    W=-1200:1:1200; % feq axis
    %% Calling V_DSB()
    [v1,v2]=V_DSB(1000,10,pi/2,1,2,T,W);
    [v3,v4]=V_DSB(1000,10,pi/2,1,1,T,W);
    [v5,v6]=V_DSB(1000,10,pi/2,1,0.5,T,W);
    %% Ploting signals 
    figure('Name',"V_DSB outputs");
    subplot(3,3,1);
    plot(T,v1);
    title("v1(Time)"); % v1 in time domain
    grid;
    subplot(3,3,2);
    stem(W,real(v2));
    title("v1(Freq)(real)"); % v1 in frq domain (real part)
    grid;
    subplot(3,3,3);
    stem(W,imag(v2));
    title("v1(Freq)(imag)"); % v1 in frq domain (imaginary part)
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
    title("v2(Freq)(imag)"); % v2 in frq domain (imaginary part)
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
end
%% V_DSB function
% concept->
%     message wave(mw)=Am*cos(2*pi*fm.*t);
%     carrier wave(cw)=cos((2*pi*fc.*t)+ PHIc);
%     V_dsb in time(vt)=A.*mw.*cw;
% For freq domain it is just F.T of vt
function [vt,vf]=V_DSB(fc,fm,PHIc,A,Am,t,f)
    vt=A*Am*cos(2*pi*fm.*t).*cos((2*pi*fc.*t)+PHIc);% This is ous vdsb signal in Time domain
    vf=A*Am*(1/4).*(exp(1i*PHIc).*(D_D(f,(fc-fm))+D_D(f,(fc+fm)))+exp(-1i*PHIc).*(D_D(f,(-fc-fm))+D_D(f,(-fc+fm))));% This is ous vdsb signal in Freq domain
end
%% Dirac delta function
function vf=D_D(f,fx) 
% fx is the point at which d_d is to be ploted
    vf=zeros(size(f));
    if(ismember(fx,f)) % if fx is in f
        vf(fx+1-f(1))=1; % at point fx vf=1
    end
end