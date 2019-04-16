clear; 
clc;

%% Define the unknown function to interpolate
%f = @(x) exp(x).*sin(x);
f = @(x) 1./(1+25*x.^2);

%% Setup different numbers of interpolation nodes/data sites.
Nd = [2,4,8,16,32,64,128,256];

%% Setup the points at which we want to evaluate the interpolant
xe = linspace(-1,1,10000)'; %generate evenly-spaced points
ye = f(xe); %evaluate function

%% Preallocate space for numerical solution
ye_num = zeros(length(ye),length(Nd));

%% Start plotting stuff
figure
plot(xe,ye,'black');
pause %waits for input

%% Loop goes over different numbers of interpolation nodes
elapsed_time = zeros(length(Nd),1); %create a vector that stores the amount of time for each set of data points
for it=1:length(Nd)
    tic %start the clock
    %% initialize a zero matrix according to the number of nodes
    x = zeros(Nd(it),1);
    %% Compute the Chebyshev Points
    for k=1:Nd(it)
        x(k,1) = cos(((k - 1)/ (Nd(it) - 1)) * pi);
    end
    
    %x = linspace(-1,1,Nd(it))'; %generate evenly-spaced points in [-1,1].
    y = f(x);
    
    %% Form Vandermonde matrix "intelligently"
    V = zeros(length(x),length(x));
    for vit = 1:Nd(it)
        V(:,vit) = x.^(vit-1);
    end
    
    %% Compute coefficients by solving linear system
    a = V\y;
    
    %% Evaluate polynomial interpolant by building eval matrix and
    %% multiplying with coefficients.
    Ve = zeros(length(xe),length(x));
    for vit = 1:Nd(it)
        Ve(:,vit) = xe.^(vit-1);
    end
    ye_num(:,it) = Ve*a; %Do the matrix-vector product to predict values
    %% add the time it took for the loop to run into elapsed_time
    elapsed_time(it) = toc;
    
    %% Plot stuff
    hold on;
    plot(xe,ye_num(:,it),'o');
    drawnow
    pause
end

%% Now plot relative errors
figure
e2 = zeros(length(Nd),1);
for it=1:length(Nd)
    e2(it,1) = norm(ye_num(:,it)-ye)./norm(ye);
end
semilogy(elapsed_time,e2); %graph elapsed time and the error
    
    