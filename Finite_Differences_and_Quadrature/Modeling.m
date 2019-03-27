syms x0 x1 x2 x;

%% Differentiating and simplifying the lagrange form for l0
q = (x-x1)*(x-x2);
g = simplify(diff(q,x,1));

%% Differentiating and simplifying the lagrange form for l1
r = (x-x0)*(x-x2);
k = simplify(diff(r,x,1));

%% Differentiating and simplifying the lagrange form for l2
a = (x-x0)*(x-x1);
s = simplify(diff(a,x,1));

%% Differentiating and simplifying the finite difference error
j = (x-x0)*(x-x1)*(x-x2);
f = simplify(diff(j,x,1));

%% Compute Some Integrals
% Integrating the lagrange form for l0
w = (x-x1)*(x-x2);
e = simplify(int(w,x));

% Integrating the lagrange form for l1
t = (x-x0)*(x-x2);
y = simplify(int(t,x));

% Integrating the lagrange form for l2
u = (x-x0)*(x-x1);
i = simplify(int(u,x));

