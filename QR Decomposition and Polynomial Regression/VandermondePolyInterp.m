clear; 
clc;

%% Define the unknown function to interpolate
f = @(x) sin(x) + 0.1*rand(length(x),1);

%% Numbers of data points.
Nd = 5; % the M value

%% User defined polynomial degree l
l = 3;

%% Define an N value based on the l
N = l + 1;

%% Setup the points at which we want to evaluate the interpolant
xe = linspace(-1,1,1000)'; %generate evenly-spaced points
ye = f(xe); %evaluate function

%% Start plotting stuff
figure
plot(xe,ye,'black');
%pause %waits for input

x = linspace(-1,1,Nd)'; %generate evenly-spaced points in [-1,1].
y = f(x);

%% Form Vandermonde matrix "intelligently"
%V = zeros(Nd,Nd);
%for vit = 1:Nd
    %V(:,vit) = x.^(vit-1);
%end

V = zeros(Nd,N);
for vit = 1:N 
    V(:,vit) = x.^(vit-1);
end


%% Compute the QR decomposition matrix Vector
[Q, R] = qr(V);

%% Obtain Q1 and R1
Q1 = Q(:, 1:N);
R1 = R(1:N, 1:N);
    

%% Compute coefficients by QR decomposition.
a = V\y;

%% Evaluate polynomial interpolant by building eval matrix and
%% multiplying with coefficients.
% Ve = zeros(length(xe),Nd);
% for vit = 1:Nd
%     Ve(:,vit) = xe.^(vit-1);
% end
% ye_num = Ve*a; %Do the matrix-vector product to predict values

Ve = zeros(length(xe), N);
for vit = 1:N
    Ve(:,vit) = xe.^(vit-1);
end
ye_num = Ve*a; %Do the matrix-vector product to predict values

%% Plot stuff
hold on;
plot(xe,ye_num,'-');
drawnow
%pause


    
    