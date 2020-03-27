a = 0;
b = 2;
ns = [4,8,16];
I = (exp(4)/13) * (2*sin(6) - 3*cos(6)) + (3/13);

fprintf('The approximations of the integral of f(x) from %d to %d, using the Composite Trapezoidal Rule:\n\n', a, b);
fprintf('Approximations: \tAbsolute Errors:\n');
for i = 1:length(ns)
    n = ns(i);
    approx = compTrapezoidal(a, b, n);

    fprintf('I_%d = %f, \t|I - I_%d| = %f\n', n, approx, n, absoluteError(I, approx));
end
fprintf('\nI = %f (exact)\n', I);

function approx = compTrapezoidal(a, b, n)
    % This function approximates the integral of the given function f(x), from
    % the endpoints a to b. The method used is the Composite Trapezoidal Rule.
    % the endpoints used as the limit of the definite integral, a, b
    % the amount of subintervals for the composite rule to use, n

    h = (b - a) / n;

    sum1 = 0;
    for j = 1:(n-1)
        x = a + j*h;
        sum1 = sum1 + f(x);
    end
    
    approx = h/2 * (f(a) + 2*sum1 + f(b));

end % end of compTrapezoidal

function y = f(x)
    y = exp(2*x) * sin(3*x);
end % end of f

function error = absoluteError(exact, approx)
    error = abs(exact - approx);
end % end of absoluteError