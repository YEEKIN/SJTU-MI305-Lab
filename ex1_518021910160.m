% Name: Yijian Kong
% ID: 518021910160

% Clear all
clc;
clear;
tic;

% Locations of sensors
R = 40;
OS1 = [50.5 -0.9*pi/180];
% OS1 = [50.5 0];
OS2 = [51.2 2*pi/3];
OS3 = [50.0 4*pi/3];  % Since my ID ends with "0", OS3 is equal to 50.0

% Generate random location for P
l = (rand(1,3))/10;
alpha = rand(1,3).*2.*pi;
P_x = l.*cos(alpha);
P_y = l.*sin(alpha);
P_Loc = [P_x' P_y'];

% Calculate m
i = 1;  % Choose the fiest random point P
m1(i) = OS1(1)-(l(i)*cos(OS1(2)-alpha(i))+sqrt(-l(i)*l(i)*sin(OS1(2)-alpha(i))*sin(OS1(2)-alpha(i))+R^2));
m2(i) = OS2(1)-(l(i)*cos(OS2(2)-alpha(i))+sqrt(-l(i)*l(i)*sin(OS2(2)-alpha(i))*sin(OS2(2)-alpha(i))+R^2));
m3(i) = OS3(1)-(l(i)*cos(OS3(2)-alpha(i))+sqrt(-l(i)*l(i)*sin(OS3(2)-alpha(i))*sin(OS3(2)-alpha(i))+R^2));

% Introduce error to m
% m1(i) = m1(i)+normrnd(0,0.00005);
% m2(i) = m2(i)+normrnd(0,0.00005);
% m3(i) = m3(i)+normrnd(0,0.00005);

% Calculate locations of point A,B and C
Point_A = [(OS1(1)-m1(i))'.*cos(OS1(2)) (OS1(1)-m1(i))'.*sin(OS1(2))];
Point_B = [(OS2(1)-m2(i))'.*cos(OS2(2)) (OS2(1)-m2(i))'.*sin(OS2(2))];
Point_C = [(OS3(1)-m3(i))'.*cos(OS3(2)) (OS3(1)-m3(i))'.*sin(OS3(2))];

% Use A,B and C to calculate r and the location of center
x1 = Point_A(1,1);    x2 = Point_B(1,1);    x3 = Point_C(1,1);
y1 = Point_A(1,2);    y2 = Point_B(1,2);    y3 = Point_C(1,2);
z1 = x2^2+y2^2-x1^2-y1^2;
z2 = x3^2+y3^2-x1^2-y1^2;
z3 = x3^2+y3^2-x2^2-y2^2;
A = [(x2-x1), (y2-y1); (x3-x1), (y3-y1); (x3-x2), (y3-y2)];
B = 0.5*[z1; z2; z3];
theta = (inv(A'*A))*A'*B;
r = sqrt((theta(1)-x1)^2+(theta(2)-y1)^2);

% Error of calculation
error_r = r-R;
error_center = [(theta(1)-P_Loc(i,1)) (theta(2)-P_Loc(i,2))];

% Display results
disp('ID: 518021910390  Name: Yijian Kong');

OS_results = ['OS1: ',num2str(OS1(1)),'mm','  OS2:',num2str(OS2(1)),'mm','  OS3:',num2str(OS3(1)),'mm'];
disp(OS_results);

True_value = ['True value of radium: ',num2str(R),'mm'];
disp(True_value);

PLoc_result = ['Location of P: P1(',num2str(P_Loc(1,1)),',',num2str(P_Loc(1,2)),')  P2(',num2str(P_Loc(2,1)),',',num2str(P_Loc(2,2)),')  P3(',num2str(P_Loc(3,1)),',',num2str(P_Loc(3,2)),')'];
disp(PLoc_result);

m_result = ['Caculated m: m1=',num2str(m1(i)),'mm  m2=',num2str(m2(i)),'mm  m3=',num2str(m3(i)),'mm'];
disp(m_result);

R_result = 'Calculated value of radium: r=%5.5fmm\n';
fprintf(R_result, r);

Center_result = ['Calculated coordinates of center: (',num2str(roundn(theta(1),-5)),',',num2str(roundn(theta(2),-5)),')'];
disp(Center_result);

Error_result1 = 'Error of radium: %5.5fmm\n'; 
fprintf(Error_result1, error_r);

Error_result2 = 'Error of center: (%5.5f,';
fprintf(Error_result2, error_center(1));

Error_result3 = '%5.5f)\n';
fprintf(Error_result3, error_center(2));