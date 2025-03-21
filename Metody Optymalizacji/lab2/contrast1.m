function[min,i]=contrast(beta,N,f,x0,x1)
    x=zeros(N);
    x(1)=x1;
    i=0

    if f(x0)>f(x1)
        temp=x0;
        x0=x1;
        x1=temp;
    end

    for i=2:N
        x(i)=x0+(beta^(i-1))*(x1-x0);

        if f(x(i))<f(x0)
            min=[x0 x(i-1)];
            return
        end
    end
    if i==N
        min="ludzie,tu nikogo nie ma";
    end
end