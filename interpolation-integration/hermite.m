times = [0,3,5,8,13];
distances = [0,225,383,623,993];
speeds = [75,77,80,74,72];
% time = [1.3,1.6,1.9];
% distance = [0.6200860,0.4554022,0.2818186];
% speed = [-0.5220232,-0.5698959,-0.5811571];
t = 10;

position = hermiteInterpolation(times, distances, speeds, t);
fprintf('The approximation of position f(t) when t = %d, is H_9(%d) = %f, using the Hermite Polynomial.\n', t, t, position);

function approx = hermiteInterpolation(xVals, fVals, fPrimeVals, x)
    % This function performs Hermite Interpolation using Newton's Divided
    % Difference. Obtaining the coefficients of the Hermite Polynomial, and
    % outputting a table of the process. Also approximates f(x) for a given x.
    % The input parameters are: 
    % x values, xVals
    % function values, fVals
    % function derivative values, fPrimeVals
    % input x value to approximate, x

    n = length(xVals);
    zs = zeros(1, 2*n);
    Qs = zeros(2*n);

    for i = 1:n
        zs(2*i-1) = xVals(i);
        zs(2*i)= xVals(i);
        Qs(2*i-1, 1) = fVals(i);
        Qs(2*i, 1) = fVals(i);
        Qs(2*i, 2) = fPrimeVals(i);

        if i ~= 1
            Qs(2*i-1, 2) = (Qs(2*i-1, 1) - Qs(2*i-2, 1)) / (zs(2*i-1) - zs(2*i-2));
        end
    end

    for i = 3:(2*n)
        for j = 3:i
            Qs(i,j) = (Qs(i, j-1) - Qs(i-1, j-1)) / (zs(i) - zs(i-j+1));
        end
    end

    % Ouputting the table of coefficients.
    VarNames = {'z','f(z)','1st','2nd','3rd','4th','5th','6th','7th','8th','9th'};
    Table = table(zs(:),Qs(:,1),Qs(:,2),Qs(:,3),Qs(:,4),Qs(:,5),Qs(:,6),Qs(:,7),Qs(:,8), ...
    Qs(:,9),Qs(:,10),'VariableNames',VarNames);

    display(Table)

    % Approximating value of f(x) using Hermite Polynomial.
    approx = Qs(1,1);
    factors = 1;
    for i = 2:(2*n)
        factors = factors * (x - zs(i-1));
        approx = approx + Qs(i,i) * factors;
    end

end % end of hermiteInterpolation