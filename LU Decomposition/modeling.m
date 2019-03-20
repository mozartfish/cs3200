function m = modeling(A)

[~, N] = size(A);

% disp(N);

for i = 1:N-1
   [~,m] = max(abs(A(:,i))); 
end

return
end