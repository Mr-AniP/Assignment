t=0:0.1:20;
u=@unitstep;
% ky=@gb;
syms i;
kc=@fn_convolution;
h=((exp(-1*t)-exp(-4*t))*u(t))/2;
x=((sin(t))*u(t)).*(exp(-1*t));
% nj=ky(t*10);
y=kc(x,h,length(x));
figure(4);
plot(t,h);
figure(5);
plot(t,x);
% figure(3);
% plot(t,nj);
% for i=1:201
%     y(i)=z(i);
% end
figure(6);
plot(t,y);
% function m=gb(i)
%     m=0;
%     for k=0:i
%         m=m+((exp(-1*((k/10)))*(sin(((k/10)))))*((exp(-1*((i/10)-(k/10))-exp(-4*((i/10)-(k/10)))))/2));
%     end
% end
function m=unitstep(k)
    if k>=0
        m=1;
    else
        m=0;
    end
end
function m=fn_convolution(l,p,v)
    if v>=(length(l)+length(p)-1)
        v=(length(l)+length(p)-1);
    end
    m=ones(v);
    if length(l)<length(p)
        for k=1:v
            m(k)=0;
            for i=1:length(l)
                if (k<(length(p)+i) && (k-i+1)>0)
                    m(k)=m(k)+(p(k-i+1)*l(i));
                end
            end
        end
    else
        for k=1:v
            m(k)=0;
            for i=1:length(p)
                if (k<(length(l)+i) && (k-i+1)>0)
                    m(k)=m(k)+(l(k-i+1)*p(i));
                end
            end
        end
    end
end