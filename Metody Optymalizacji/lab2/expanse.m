function [min, i] = expanse(f, x0, x1, alfa, Nmax)
    x = zeros(Nmax+1);
    x(1) = x1;
    i = 0;
    
    if f(x0) == f(x1)
        min = [x0 x1];
        return
    end    
    
    if f(x1) > f(x0)
        x1 = -x1;
        if f(x1) >= f(x0)
            min = [x1, -x1];
            return
        end
    end
    
    ok = 1;
    i = i + 1;
    while ok
        if i > Nmax + 1
            error("Nie uda³o siê ustaliæ przedzia³u Nmax krokach");
            return;
        end
        i = i + 1;
        x(i + 1) = alfa^i*x1;
        ok = f(x(i)) <= f(x(i + 1));
    end
    
    if x(i - 1) < x(i + 1)
        min = [x(i - 1) x(i + 1)];
    else
        min = [x(i + 1) x(i - 1)];
    end
    i = i - 1;
end