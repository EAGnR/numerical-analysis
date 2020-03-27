a = 0;
b = 2;
ns = [4,8,16];
I = (exp(4)/13) * (2*sin(6) - 3*cos(6)) + (3/13);

fprintf('The approximations of the integral of f(x) from %d to %d, using the Composite Midpoint Rule:\n\n', a, b);
fprintf('Approximations: \tAbsolute Errors:\n');
for i = 1:length(ns)
    n = ns(i);
    approx = compMidpoint(a, b, n);

    fprintf('I_%d = %f, \t|I - I_%d| = %f\n', n, approx, n, absoluteError(I, approx));
end
fprintf('\nI = %f (exact)\n', I);

function approx = compMidpoint(a, b, n)
    % This function approximates the integral of the given function f(x), from
    % the endpoints a to b. The method used is the Composite Midpoint Rule.
    % the endpoints used as the limit of the definite integral, a, b
    % the amount of subintervals for the composite rule to use, n

    h = (b - a) / (n + 2);

    sumEven = f(a + h); % Adding the 0th x.
    for j = 1:(n/2)
        x = a + ((2*j)+1)*h;
        sumEven = sumEven + f(x);
    end
    
    approx = 2*h * sumEven;

end % end of compMidpoint

function y = f(x)
    y = exp(2*x) * sin(3*x);
end % end of f

function error = absoluteError(exact, approx)
    error = abs(exact - approx);
end % end of absoluteError