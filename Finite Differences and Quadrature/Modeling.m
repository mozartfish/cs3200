syms x0 x1 x2 x;

%% Differentiating and simplifying the lagrange form for l0
q = (x-x1)*(x-x2)/((x0-x1)*(x0-x2));
g = simplify(diff(q,x,1));

%% Differentiating and simplifying the lagrange form for l1
r = (x-x0)*(x-x2)/((x1-x0)*(x1-x2));
k = simplify(diff(r,x,1));

%% Differentiating and simplifying the lagrange form for l2
a = (x-x0)*(x-x1)/(x2-x0)*(x2-x1);
s = simplify(diff(a,x,1));

%% Find the sum of all the polynomial derivatives
m = g + k + s;
f = simplify(m);