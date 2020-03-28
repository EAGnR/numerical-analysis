initialP0 = 0.1;
initialP1 = 0.7;
tolerance = 10.0^(-4);
iterations = 25;

fprintf('Running Secant method for equation (a):\n')
secantMethod(@eqnA, initialP0, initialP1, tolerance, iterations);
fprintf('\nRunning Secant method for equation (b):\n')
secantMethod(@eqnB, initialP0, initialP1, tolerance, iterations);

function p = secantMethod(f, p0, p1, tol, n)
    % This function performs Secant method
    % in order to approximate the root of a function.
    % The input parameters are: 
    % target function, f
    % initial approximation, p0 
    % error tolerance, tol
    % max iterations, n

    fprintf('p0 = %.9f, p1 = %.9f, tolerance = %.9f\n', p0, p1, tol);

    f0 = f(p0);
    f1 = f(p1);

    for i = 2:n
        p = p1 - (f1*(p1-p0) / (f1-f0));

        fprintf('i:%d, p = %.9f\n', i, p);

        if abs(p - p1) < tol
            fprintf('The method converged after %d iterations!\n', i);
            return;
        end

        p0 = p1;
        f0 = f1;
        p1 = p;
        f1 = f(p);
    end

    fprintf('The method failed after %d iterations.\n', n);

end % end of secantMethod

function y = eqnA(x)

    y = x^3 + x^2 + 2.0*x;

end % end of eqnA

function y = eqnB(x)

    y = exp(x) - x - 1.0;

end % end of eqnB