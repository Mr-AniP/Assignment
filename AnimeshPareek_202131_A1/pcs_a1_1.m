myfn=@boxt;
myfn(-5,5);
function boxt(t1,t2)
% please note that t2 >= t1
    if(t2~=t1)
        n=0:0.01:(t2-t1);
        x=zeros((t2-t1)*100 +1);
        for m=0:0.01:((t2-t1))
            if m+t1>=-0.5 && m+t1<=0.5
                x(int16(m*100) +1)=1;
            end
        end
        figure(1);
        plot(n+t1,x);
    else
        n=ones(1);
        x=zeros(1);
        if t1>=-0.5 && t1<=0.5
            x(1)=1;
        end
        figure(1);
        plot(n+t1-1,x);
    end
end