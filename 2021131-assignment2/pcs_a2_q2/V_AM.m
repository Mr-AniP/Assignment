%% Amplitude Modulation function (Question-2)
%% V_AM
%_V_AM()_ is the function to generate Conventional AM signals
% Concept is ->
%     message wave(mw)=Am*cos(2*pi*fm.*t);
%     carrier wave(cw)=cos((2*pi*fc.*t)+ PHIc);
%     V_AM in time(vt)=A.*mw.*cw + Ac.*cw;

function [vt,vf,amod,u]=V_AM(fc,fm,PHIc,A,Ac,Am,t,f)
    vt=((A*Am*cos(2*pi*fm.*t))+Ac).*cos((2*pi*fc.*t)+PHIc); % generating time domain signal
    mn=A*Am;
    %%
    % Calculating modulation Index and proposing of Ac value
    amod=A*Am/Ac;
    if(Ac>mn)
        u="Ac should be greator than "+mn +" . Here Ac=1 works!!";
    elseif(A==mn)
        u="Ac should be greator than "+mn +" . Here Ac=1 just worked but still it is not advisable to use it. Ac= "+(mn+1)+" will work here !!";
    else
        u="Ac should be greator than "+ mn+" . Here Ac=1 does not work. Ac= "+(mn+1)+" will work here !!" ;
    end
    %%
    %     For freq domain it is just F.T of vt
    vf=(A*Am*(1/4).*(exp(1i*PHIc).*(D_D(f,(fc-fm))+D_D(f,(fc+fm)))+exp(-1i*PHIc).*(D_D(f,(-fc-fm))+D_D(f,(-fc+fm)))))+((Ac*(1/2).*(D_D(f,(-fc))+D_D(f,(fc)))));% generating freq domain signal
end
%% Dirac delta function
function vf=D_D(f,fx)
% fx is the point at which d_d is to be ploted
    vf=zeros(size(f));
    if(ismember(fx,f)) % if fx is in f
        vf(fx+1-f(1))=1; % at point fx vf=1
    end
end
