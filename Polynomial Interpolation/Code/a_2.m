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

c = zeros(length(Nd),1);
%% Loop goes over different numbers of interpolation nodes
for it=1:length(Nd)
    %% initialize a zero matrix according to the number of nodes to calculate the 
    x = zeros(Nd(it),1);
    
    %% compute the chebysehv extrema values for each of the points
    for k=1:Nd(it)
        x(k,1) = cos(((k - 1)/ (Nd(it) - 1)) * pi);
    end
    
    %x = linspace(-1,1,Nd(it))'; %generate evenly-spaced points in [-1,1].
    %y = f(x);
    
    %% Form Vandermonde matrix "intelligently"
    V = zeros(length(x),length(x));
    for vit = 1:Nd(it)
        V(:,vit) = x.^(vit-1);
    end
    
    %Compute the condition number
    condition_number = cond(V);
    c(it) = condition_number;
end

%% Now plot relative errors

semilogy(Nd,c);
    