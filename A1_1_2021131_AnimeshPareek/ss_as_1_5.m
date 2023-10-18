n=0:20;
u=@unitstep;
x=0:20;
for i=n
    x(i+1)=(i*(u(i)-u(i-10)))+(10*exp((-0.3*(i-10)))*(u(i-10)-u(i-20)));
end
figure(1);
stem(n,x);
k=0:50;
y=0:50;
for i=k
    y(i+1)=cos(0.03*i*pi)+u(i);
end
figure(2);
stem(k,y);
function m=unitstep(j)
    if j>=0
        m=1;
    else
        m=0;
    end
end
