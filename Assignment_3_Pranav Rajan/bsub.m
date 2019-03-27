% This algorithm implements back substitution for solving matrices
% using the lecture notes and algorithms given by Professor Varun Shankar
% Author: Pranav Rajan
% Date: March 18, 2019

function x = bsub(U, y)

% Determine the value of N for the N x N matrix U
[~, N] = size(U);

% Initialize X to a column vector of zeros
x = zeros(N,1);

x(N) = y(N)/U(N,N);

for i = N -1:-1:1
    x(i) = (y(i)-U(i,i+1:N)*x(i+1:N))/U(i,i);
end

return
end