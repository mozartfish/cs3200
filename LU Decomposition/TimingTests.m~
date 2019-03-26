%% This file contains all the timing tests as described by Professor Varun Shankar
% The following timing tests show the cost of performing LUP decomposition
% based on the number of rhs.

% Author: Pranav Rajan
% Date: March 25, 2019

clear;
clc;

% Define a value for N which will be used for determining the dimensions of
% the N x N matrix
N = 60;

% Initialize a random matrix A with N x N dimensions
A = rand(N,N);

% Define the number of rhs
nrhs = 1:N;

% Define the time vectors 
time_test1 = zeros(length(nrhs),1);
time_test2 = zeros(length(nrhs),1);

for i = 1:length(nrhs)
    
    % Create a new B vector
    B = rand(N, nrhs(i));
    
    % create vectors with N rows and i columns
    X1 = zeros(N, nrhs(i));
    X2 = zeros(N, nrhs(i));
    
    % Timing Test 1
    % Start timer
    tic
    
    % Call LUP function exactly once
    [L, U, P] = lup(A);
    
    % Solve the matrix
    for j = 1:nrhs(i)
        X1(:, j) = bsub(U, fsub(L, P * B(:, j)));
    end

    % stop the timer
    time_test1(i) = toc;
    
    % Timing Test 2
    % start the timer
    tic
        for j = 1:nrhs(i)
             [L, U, P] = lup(A);
            X2(:, j) = bsub(U, fsub(L, P * B(:, j)));
        end
    
    % stop the timer
    time_test2(i) = toc;
end

% plot stuff
figure
loglog(nrhs, time_test1);
hold on;
loglog(nrhs, time_test2);




















