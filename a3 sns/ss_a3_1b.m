n=0:1:2000;
w=0:0.1:4*pi;
x=zeros(2001);
x(997)=1;
x(998)=1;
x(999)=1;
x(1000)=1;
x(1001)=1;
x(1002)=1;
x(1003)=1;
x(1004)=1;
x(1005)=1;
l=zeros(126);
for m=0:1:125
    for k=n
    l(m+1)=l(m+1)+(x(k+1)*exp(((k-1000)*(w(m+1)-2*pi)*-1i)));
    end
end
figure(1);
stem(n-1000,x);
figure(2);
plot(w-(2*pi),real(l));
figure(3);
plot(w-2*pi,imag(l));
figure(4);
plot(w-(2*pi),abs(l));