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

%% Loop goes over different numbers of interpolation nodes
elapsed_time = zeros(length(Nd),1); %create a vector that stores the amount of time for each set of data points
for it=1:length(Nd)
    tic
    %% initialize a zero matrix according to the number of nodes
    x = zeros(Nd(it),1);
    
    for k=1:Nd(it)
        x(k,1) = cos(((k - 1)/ (Nd(it) - 1)) * pi);
    end
    
    y = f(x);
    
    poly_fit = polyfit(x,y,Nd(it)-1); %% according to this link https://www.youtube.com/watch?v=K2dsK3FFbik,
    %%the third parameter of polyfit represents the degree of the
    %%polynomial. Based on the values chosen by Professor Shankar, I picked
    %%the third parameter to be Nd(it) - 1 because it seems to follow the
    %%matrix notation on page 2 for the exponents of x in the polynomial
    %%interpolation notes. Let us take the value of 2 from the first index
    %%of Nd. Then from the way I think polyfit behaves which seems like vandermode, we would get a 2x2
    %%matrix where the highes order degree would be 1 since that takes the
    %%first two terms. 
    poly_val = polyval(poly_fit,xe); %% evaluate the polynomial at some specific point that we are interested in
    
    %%Evaluate all the stuff between 1 and the value we get from evaluating
    %%poly_val
    for i=1:length(poly_val) %poly_val is an array that contains all the coefficents of the polynomial
        ye_num(i,it) = poly_val(i);
    end
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
e2 = zeros(length(result),1);
derivative = diff(f,x,1);
for it=1:length(result)
    e2(it,1) = norm(vpa(subs(derivative,x,input(it,1)))-result(it,1))/norm(result(it,1));
end
semilogy(N,e2);
    