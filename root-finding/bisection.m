a = -0.71;
b = 0.7;
tolerance = 10.0^(-4);
iterations = 25;

fprintf('Running bisection method for equation (a):\n')
bisectionMethod(@eqnA, a, b, tolerance, iterations);
fprintf('\nRunning bisection method for equation (b):\n')
bisectionMethod(@eqnB, a, b, tolerance, iterations);

function p = bisectionMethod(fFunc,a,b,tol,n)
    % This function performs a bisection or binary-search
    % in order to approximate the root of a function.
    % The input parameters are: 
    % target function, fFunc
    % endpoints, a, b 
    % error tolerance, tol
    % max iterations, n

    fprintf('a = %.9f, b = %.9f, tolerance = %.9f\n', a, b, tol);

    if fFunc(a) * fFunc(b) >= 0
        fprintf('Since f(a)*f(b) >= 0 then bisection cannot converge on [%f,%f].\n', a, b);
        return;
    end

    fa = fFunc(a);
    pPrev = 0.0;

    for i = 1:n
        p = (a + b) / 2.0;
        fp = fFunc(p);

        fprintf('i:%d, p = %.9f\n', i, p);

        if i > 1 && abs(p - pPrev) < tol
            fprintf('The method converged after %d iterations!\n', i);
            return;
        end

        if fa * fp > 0.0
            a = p;
            fa = fp;
        else
            b = p;
        end

        pPrev = p;
    end

    fprintf('The method failed after %d iterations.\n', n);

end % end of bisectionMethod

function y = eqnA(x)

    y = x^3 + x^2 + 2.0*x;

end % end of eqnA

function y = eqnB(x)

    y = exp(x) - x - 1.0;

end % end of eqnB