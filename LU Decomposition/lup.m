% This algorithm implements LU decomposition with Partial Pivoting
% using the notes and algorithms given by Professor Varun Shankar
% Author: Pranav Rajan
% Date: March 18, 2019

function [L, U, P] = lup(A)

% Initialize some stuff

%get size of N x N matrix A
[~, N] = size(A);

U = A;
L = eye(N, N);
P = eye(N, N);

for i = 1:N-1
    % Find m >= i that results in maximum |U(m,i)| (index of largest column
    % element in absolute value)
    [~,m] = max(abs(U(i:N,i)));
    
    % Account for the offset since we are looking at all values below the
    % diagonal
    m = m + i-1;
    
    % Swap rows U(i,i:N) and U(m,i:N)
    temp = U(i,i:N);
    U(i,i:N) = U(m,i:N);
    U(m,i:N) = temp;
    
    % Swap rows L(i,1:i-1) and L(m,1:i-1)
    temp = L(i,1:i-1);
    L(i,1:i-1) = L(m,1:i-1);
    L(m,1:i-1) = temp;
    
    % Swap m row of P and row i of P
    temp = P(m,:);
    P(m,:) = P(i,:);
    P(i,:) = temp;
    
    for j=i+1:N
        L(j,i) = U(j,i)/U(i,i);
        U(j,i:N) = U(j,i:N)-L(j,i)*U(i,i:N);
    end
end

return
end