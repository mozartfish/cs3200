% This algorithm implements forward substitution
% using the notes and algorithm given by Professor Varun Shankar
% Author: Pranav Rajan
% Date: March 18, 2019

function y = fsub(L, d)

% Initialize y = d
y = d;
[~, N] = size(L);

for i=2:N
    y(i)=d(i)-L(i,1:i-1)*y(1:i-1);
end

return
end