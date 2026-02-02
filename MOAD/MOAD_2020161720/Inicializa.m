function [A,c,b,x,xB,cB,SBA,zjcj]=Inicializa(n,m,c,A,b)

%Initialize variables
I=eye(m);
A=[A I];   % Add slack columns to matrix A
cs=zeros(1,m);  % Coefficientes of the slacks in the objective function
c=[c cs];       % Add coefficientes of the slacks to the coefficients of the original
x=1:n;          % Create indexes of original variables 
xs=n+1:n+m;     % Create indexes of slacks
x=[x xs];       % Merge coefficients of all variables in vetor x
xB=xs';         % Create vetor of indexes of basic variables
cB=cs';         % Create vetor of coefficients of basic variables in objective function
zjcj=zeros(1,n+m);  % Initialize row zj-cj with zeros
SBA=[zeros(n,1);b]; % The first feasible basic solution (SBA) has "n" zeros corresponding 
                    % to original variablesand "m" values of slacks that are equal to the
                    % independent terms of constraints