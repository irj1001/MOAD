%--------------------------------------------------------------- 
% Main program 
%--------------------------------------------------------------- 
clc 
disp('----------------------------------------------------------') 
disp(' Solving a problem by the dual method of Simplex ') 
disp('----------------------------------------------------------') 
disp(' It is assumed that: ') 
disp(' -> Objective function is in the minimization form') 
disp(' -> All constraints are of type ">=" ') 
disp(' -> All variables are >=0 ') 
disp('----------------------------------------------------------') 

% Asks for problem data 
[n,m,c,A,b]=Get_data; 
% Convert problem to standard form 
[c,A,b]=Convert(n,m,c,A,b) 
% Initialize variables 
[A,c,b,x,xB,cB,SBA,zjcj]=Inicializa(n,m,c,A,b); 

% Solve by dual simplex method 
[n,m,A,c,b,x,xB,cB,SBA,zjcj,z]=MDSimplex(n,m,A,c,b,x,xB,cB,SBA,zjcj); 

% Present the optimal solution and the optimal value of z 
Present_final_results(n,m,SBA,z,1);