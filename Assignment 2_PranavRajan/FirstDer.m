% This code defines a function called FirstDer that takes a set of inputs
% that represent coordinates on the x axis and a set of outputs that
% represent some function f(x) evaluated at the inputs and computes the
% derivative at those points using finite differences.

%Author: Pranav Rajan
%Date: February 21,2019

function result = FirstDer(x,y)

% the spacing between points that we are sampling
h = x(2,1) - x(1,1);

% create a new vector to store the results of taking the first derivative
% for different points
result = zeros(length(y),1);

for it=1:length(y)
    % Case 1:The first point in the list of points
    if (it == 1)
        % perform forward difference calculation
        forwardDiff=(-3*y(it,1))/(2*h)+(2*y(it+1,1))/h-(y(it+2))/(2*h);
        result(it,1) = forwardDiff;
    % Case 2: The last point in the list of points
    elseif (it == length(y))
        % perform the backward difference calculation
        backwardDiff=(y(it-2,1))/(2*h)-(2*y(it-1,1))/h+(3*y(it,1))/(2*h);
        result(it,1) = backwardDiff;
    else
        % Case 3: A point that is neither the first point or the last point
        centralDiff=(-y(it-1,1))/(2*h)+(y(it+1,1))/(2*h);
        result(it,1) = centralDiff;
    end
end

return
end
