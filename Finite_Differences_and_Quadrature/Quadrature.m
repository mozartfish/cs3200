% This code computes the quadrature for some function f(x)
syms x0 x1 x2 x;

% Integral for the first lagrange basis l0
q = ((x-x1)*(x-x2))/((x0-x1)*(x0-x2));
g = simplify(int(q,x,x0,x2));

% Integral for the second lagrange basis l1
k = ((x-x0)*(x-x2))/((x1-x0)*(x1-x2));
l = simplify(int(k,x,x0,x2));

% Integral for the third lagrange basis l2
f = ((x-x0)*(x-x1))/((x2-x0)*(x2-x1));
p = simplify(int(f,x,x0,x2));


% Integral for the quadrature error
a = (x-x0)*(x-x1)*(x-x2);
s = simplify(int(a,x,x0,x2));

