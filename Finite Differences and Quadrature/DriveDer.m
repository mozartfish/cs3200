syms x;

% The following code serves as a driver program for FirstDer and returns a
% plot of the error between of the error between the actual derivative
% evaluated at those points and the finite differences computed in FirstDer

% Author: Pranav Rajan
% Date: February 21, 2019

% An anonymous function for collecting data
f = @(x) cos(x);

% Variables to keep track of the total number of points, starting point, and
% ending point
N = 1000;
a = -1;
b = 1;

% A vector that contains a list of N evenly spaced points
input = linspace(a,b,N)';

% A vector that stores all the outputs when the anonymous function 
% evaluates the points in the vector containing the evenly spaced points
output = zeros(N,1);

% populate a vector that stores all corresponding f(x) values for the
% anonymous function
for it = 1:N
    output(it,1) = f(input(it,1));
end

% call FirstDer and store the result in foo
foo = FirstDer(input,output);

% create an empty vector to store all the values mapped from 3 to N
error = zeros(size(3:N))';

for i=3:N
    % determine the linspace for i number of points
    input= linspace(a,b,i)';
    
    % compute the corresponding f(x) output
    output = f(input);
    
    % call FirstDer
    result = FirstDer(input,output);
    
    % take the derivative of the anonymous function
    df = diff(f,x,1);
    
    % convert the symbolic function to a matlab function
    g = matlabFunction(df);
  
     % compute the error
     y = norm(result-g(input))/norm(result);
     
     % add the error to the array storing the error according to the
     % corresponding point
     error(i-2,1) = y;
end
loglog(3:N,error);




    