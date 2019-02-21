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
        forwardDiff=(y(it,1)*-3*h)/(2*h)+(y(it+1,1)*-2)/h+(y(it+2,1)*-1)/(2*h);
        result(it,1) = forwardDiff;
    % Case 2: The last point in the list of points
    elseif (it == length(y))
        % perform the backward difference calculation
        backwardDiff=(y(it-2,1))/(2*h)+(y(it-1,1)*2)/h+y(it,1)/h;
        result(it,1) = backwardDiff;
    else
        % Case 3: A point that is neither the first point or the last point
        centralDiff = (y(it-1,1)*-1)/(2*h)+(y(it+1,1)*-1)/(2*h);
        result(it,1) = centralDiff;
    end
end

return
end
