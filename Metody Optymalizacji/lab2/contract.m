function [min, it] = contract(f, x0, x1, beta, N)

    x = zeros(N);
    x(1) = x1;
    it = 0;
    
    if f(x0) > f(x1)
        temp = x0;
        x0 = x1;
        x1 = temp;
    end
    for it = 2:N
        x(it) = x0 + (beta^(it - 1))*(x1 - x0);
        
        if f(x(it)) < f(x0)
            min = [x0 x(it - 1)];
            return
        end
    end
    if it == N
        min = "no_improv";
    end
end

