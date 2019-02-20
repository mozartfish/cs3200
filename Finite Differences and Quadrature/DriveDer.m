%% The following code serves as a driver for the FirstDer function\
% Author: Pranav Rajan
% Date: February 23, 2019

%%  Create an anonymous function for testing purposes
f = @(x) x^2;

% Variable that determines the spacing of the points
h = 2;

% Variable to keep track of the number of points that we want
N = 5;


% Two column vectors that store the points and their corresponding value as
% defined by the anonymous function
input = zeros(N,1);
output = zeros(N,1);

% populate a vector that stores the x values for evaluation
for it = 1: N
    %Since we are using 1 based counting, I decided to start wi
    if (it == 1)
        input(it,1) = it;
    else
        input(it,1) = input(it-1) + h;
    end
end

% populate a vector that stores all corresponding f(x) values for the
% anonymous function
for it = 1:N
    output(it,1) = f(input(it,1));
end