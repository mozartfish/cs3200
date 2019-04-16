clear; 
clc;

%% Define the unknown function to interpolate
%f = @(x) exp(x).*sin(x);
f = @(x) 1./(1+25*x.^2);

%% Setup different numbers of interpolation nodes/data sites.
Nd = [2,4,8,16,32,64,128,256];

%% Setup the points at which we want to evaluate the interpolant
xe = linspace(-1,1,1000)'; %generate evenly-spaced points
ye = f(xe); %evaluate function

%% Preallocate space for numerical solution
ye_num = zeros(length(ye),length(Nd));

%% Start plotting stuff
figure
plot(xe,ye,'black');
pause %waits for input

%% Create two vectors that can store the conditional values for the chebyshev and linspace points
c_chebyshev = zeros(length(Nd),1);
c_linspace = zeros (length(Nd),1);
%% Loop goes over different numbers of interpolation nodes
for it=1:length(Nd)
    %% initialize a zero matrix according to the number of nodes to calculate the 
    x_chebyshev = zeros(Nd(it),1);
    
    %% compute the chebysehv extrema values for each of the points
    for k=1:Nd(it)
        x_chebyshev(k,1) = cos(((k - 1)/ (Nd(it) - 1)) * pi);
    end
    
    x_linspace = linspace(-1,1,Nd(it))'; %generate evenly-spaced points in [-1,1].
    %y = f(x);
    
    %% Form Vandermonde matrix "intelligently"
    V_chebyshev = zeros(length(x_chebyshev),length(x_chebyshev));
    for vit = 1:Nd(it)
        V_chebyshev(:,vit) = x_chebyshev.^(vit-1);
    end
    
    V_linspace = zeros(length(x_linspace),length(x_linspace));
    for vit = 1:Nd(it)
        V_linspace(:,vit) = x_linspace.^(vit-1);
    end
    
    %Compute the condition number
    condition_number_chebyshev = cond(V_chebyshev);
    c_chebyshev(it) = condition_number_chebyshev;
    
    condition_number_linspace = cond(V_linspace);
    c_linspace(it) = condition_number_linspace;
end

%% Now plot relative errors

semilogy(Nd,c_chebyshev,Nd,c_linspace);
    