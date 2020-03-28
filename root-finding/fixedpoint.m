initialP0 = 0.5;
tolerance = 0.01;
iterations = 10;

fprintf('Running fixed-point iteration method g1:\n')
fixedPointIteration(@g1, initialP0, tolerance, iterations);
fprintf('\nRunning fixed-point iteration method g2:\n')
fixedPointIteration(@g2, initialP0, tolerance, iterations);

function p = fixedPointIteration(g, p0, tol, n)
    % This function performs fixed-point iteration
    % in order to approximate the root of a function.
    % The input parameters are: 
    % fixed-point method, g
    % initial approximation, p0 
    % error tolerance, tol
    % max iterations, n

    fprintf('p0 = %.9f, tolerance = %.9f\n', p0, tol);

    for i = 1:n
        p = g(p0);

        fprintf('i:%d, p = %.9f\n', i, p);

        if abs(p - p0) < tol
            fprintf('The method converged after %d iterations!\n', i);
            return;
        end

        p0 = p;
    end

    fprintf('The method failed after %d iterations.\n', n);

end % end of fixedpoint

function y = g1(x)

    y = (1.0 / 2.0) * (x^3 + 1.0);

end % end of g1

function y = g2(x)

    y = (2.0 / x) - (1.0 / x^2);

end % end of g2
