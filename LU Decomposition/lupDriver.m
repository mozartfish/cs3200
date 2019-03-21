clear;
clc;

% This file contains a script that allows for the generation of arbitrary
% matrices of size N and obtaining the LUP decomposition and forward and
% backward substitution results described in lup.m, fsub.m and bsub.m.
% Author: Pranav Rajan
% Date: March 21, 2019

% Define a value for N which will be used for determining the dimensions of
% the N x N matrix
N = 3;

% Initialize a random matrix A with N x N dimensions
A = rand(N,N);

% Define the number of rhs
nrhs = 4;

% Initialize a matrix B with the dimensions N x rhs
B = rand(N,nrhs);

% Initialize a solution matrix with the dimensions N x rhs
X = zeros(N, nrhs);

% Call lup function exactly once
[L, U, P] = lup(A);

for i = 1:nrhs
    X(:, i) = bsub(U, fsub(L, P * B(:, i)))
end



