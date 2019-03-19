% This algorithm implements LU decomposition with Partial Pivoting
% using the algorithm given by Professor Varun Shankar
% Author: Pranav Rajan
% Date: March 18, 2019

function [L, U, P] = plu(A)

% initialize the U matrix
U = A;

% get the dimensions of matrix A for creating the idenity matrix for L and
% P
[~, N] = size(A);

% Initialize L matrix
L = eye(N, N);

% Initialize P matrix
P = eye(N,N);

for i = 1: N-1
    % find the max value m >= i that results in the index of the the
    % largest column element in absolute value
    [~,m] = max(abs(U(:,i)));
    
    % swap rows U(i,i:N) and U(m,i:N)
    U(i,i:N) = U(m,i:N);
    
    % swap rows L(i,1:i-1) and L(m,1:i-1)
    L(i,1:i-1) = L(m,1:i-1);
    
    % swap row m of P and row i of P
    P(m,:) = P(i,:);
    
    for j = i + 1: N
        L(j,i) = U(j,i)/U(i,i);
        U(j,i:N) = U(j,i:N) - L(j,i).*U(i,i:N);
    end
end
end