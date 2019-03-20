function m = maxFunc(A, P, N)
% for i = 1:N
%     max = abs(A(i,p));
%     disp(numel(A(:, 1)));
%     m = i;
%     
%     if max < A(i,p)
%         max = A(i,p);
%         m = i;
%     end
% end
m = P;
for i = P:N
    if abs(A(i, P)) > abs(A(m, P))
        m = i;
    end
end

return
end