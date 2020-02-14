initialP0 = 0.7;
tolerance = 10.0^(-4);
iterations = 25;

syms x
eqnA = x^3 + x^2 + 2.0*x;
eqnB = exp(x) - x - 1.0;

fprintf('Running Newton''s method for equation (a):\n')
newtonsMethod(eqnA, initialP0, tolerance, iterations);
fprintf('\nRunning Newton''s method for equation (b):\n')
newtonsMethod(eqnB, initialP0, tolerance, iterations);

function p = newtonsMethod(fFunc,p0,tol,n)
    % This function performs Newton's method
    % in order to approximate the root of a function.
    % The input parameters are: 
    % target symbolic function, fFunc
    % initial approximation, p0 
    % error tolerance, tol
    % max iterations, n

    fprintf('p0 = %.9f, tolerance = %.9f\n', p0, tol);

    % Differentiate target function, and convert from symbolic to numeric.
    fFuncPrime = matlabFunction(diff(fFunc));
    fFunc = matlabFunction(fFunc);

    for i = 1:n
        p = p0 - (fFunc(p0) / fFuncPrime(p0));

        fprintf('i:%d, p = %.9f\n', i, p);

        if abs(p - p0) < tol
            fprintf('The method converged after %d iterations!\n', i);
            return;
        end

        p0 = p;
    end

    fprintf('The method failed after %d iterations.\n', n);

end % end of newtonsMethod