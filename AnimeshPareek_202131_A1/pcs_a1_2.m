n=0:0.01:10;
x=zeros(1001);
for m=0:1:1001
    if m>=450 && m<=500
    x(m+1)=1+2*((m*0.01)-5);
    elseif m>500 && m<=550
    x(m+1)=1-2*((m*0.01)-5);
    end
end
figure(1);
plot(n-5,x);