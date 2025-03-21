function[min,i]=expanse(f,x0,x1,alfa,Nmax)
i=0;
x=zeros(Nmax+1);
x(1)=x1;

if f(x(1))==f(x(0)) 
    min =[x(0),x(1)];
    return 
end 

if f(x(1))>f(x(0))
    x1=-x1;
    if f(x1)>=f(x0)
        min=[x(1),-x(1)];
        return 
    end
end
while True
    if i>Nmax
        error("nic tu nie ma")
        return 
    end
    i=i+1;
    x(i+1)=alfa^i*x1;
end
if x(i-1)<x(i+1)
    min=[x(i-1),x(i+1)];
    return
else
    min=[x(i+1),x(i-1)];
return 
end

