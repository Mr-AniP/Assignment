n=-20:20;
u=@unitstep;
vz=@zfn;
z=0:20;
for i=n
    z(i+21)=(u(i)-u(i-10));
end
figure(3);
stem(n,z);
ze=0:20;
for i=n
    ze(i+21)=(vz(i)+vz(((-1)*i)))/2;
end
figure(4);
stem(n,ze);
zo=0:20;
for i=n
    zo(i+21)=(vz(i)-vz(((-1)*i)))/2;
end
figure(5);
stem(n,zo);
function v=zfn(k)
    v=(unitstep(k)-unitstep(k-10));
end
function m=unitstep(j)
    if j>=0
        m=1;
    else
        m=0;
    end
end