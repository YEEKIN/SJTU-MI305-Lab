% Name: Yijian Kong
% ID: 518021910160

% ---------------------------Method 1---------------------------
% Clear all
clc;
clear;

% Setup
% Coefficient Matrix
A = [10 -3 0; 0 46 1 ; 31 0 -5; 7 11 -3; 1 1 1];
% Measurement Matrix
L = [5; 8; -28; -8; 0];
% Weight Matrix
P = [1 0 0 0 0 ; 0 2 0 0 0 ; 0 0 3 0 0 ; 0 0 0 4 0; 0 0 0 0 1e12];

% Solve
C = A'*P*A;
X = (C^-1)*A'*P*L;
X0 = A\L;
XX = A'*L;
V = L-A*X;
V(5,1) = 0;

% Calculating Standard Deviation
sigma = sqrt((P*V)'*(P*V));
D = (A'*P*A)^-1;
sigma_x = sigma*sqrt(D(1,1));
sigma_y = sigma*sqrt(D(2,2));
sigma_z = sigma*sqrt(D(3,3));

% Print results
disp('ID: 518021910390  Name: Yijian Kong');
disp('-----------------------------------');
disp('Measurement Matrix: '); L
disp('Jacobi Matrix: '); A
disp('Weight Matrix: '); P
result = ['Estimation Vector: x=',num2str(X(1)),' y=',num2str(X(2)),' z=',num2str(X(3))];
disp(result);
disp('-----------------------------------');
disp('Residual Error Matrix'); V
X1 = 'Standard Deviation: sigma=%2.4f\n';
fprintf(X1,sigma);
X2 = 'Standard Deviation: sigmax=%2.4f sigmay=%2.4f sigmaz=%2.4f\n';
fprintf(X2,sigma_x,sigma_y,sigma_z);
% ---------------------------   End  ---------------------------



% ---------------------------Method 2---------------------------
% % Clear all
% % clc;
% % clear;
% 
% % Setup
% % Coefficient Matrix
% A = [10 -3 0; 0 46 1 ; 31 0 -5; 7 11 -3];
% % Measurement Matrix
% L = [5; 8; -28; -8];
% % Weight Matrix
% P = [1 0 0 0; 0 2 0 0; 0 0 3 0; 0 0 0 4];
% 
% % Solve
% C = zeros(4)+1;
% C1 = 2*A'*P*A;
% C(1:3,1:3) = C1;
% C(4,4) = 0;
% M = zeros(4);
% M(1:3,1:4) = A'*P;
% X1 = 2*(C^-1)*M*L;
% X = X1(1:3,:);
% V = L-A*X;
% 
% sigma = sqrt((P*V)'*(P*V));
% D = (A'*P*A)^-1;
% sigma_x = sigma*sqrt(D(1,1));
% sigma_y = sigma*sqrt(D(2,2));
% sigma_z = sigma*sqrt(D(3,3));
% 
% % Print results
% disp('ID: 518021910390  Name: Yijian Kong');
% disp('-----------------------------------');
% disp('Measurement Matrix: '); L
% disp('Jacobi Matrix: '); A
% disp('Weight Matrix: '); P
% result = ['Estimation Vector: x=',num2str(X(1)),' y=',num2str(X(2)),' z=',num2str(X(3))];
% disp(result);
% disp('-----------------------------------');
% disp('Residual Error Matrix'); V
% X1 = 'Standard Deviation: sigma=%2.4f\n';
% fprintf(X1,sigma);
% X2 = 'Standard Deviation: sigmax=%2.4f sigmay=%2.4f sigmaz=%2.4f\n';
% fprintf(X2,sigma_x,sigma_y,sigma_z);
% ---------------------------   End  ---------------------------