%--------------------------------------------------------------------------
% Function that builds and displays a simplex tableau
%--------------------------------------------------------------------------
% Input parameters:
%--------------------------------------------------------------------------
% n = number of variables
% m = number of restrictions
% c = vector of the coefficients of the variables in the OF
% xB = vector with the indexes of the basic variables
% cB = vector with the coefficients of the basic variables in the OF
% A = matrix of technical coefficients
% b = vector of terms independent of constraints
% zjcj = vector containing the values ​​of the row zj-cj
% z = OF value
% iteration = iteration number
% flag = indicates whether the tableau is optimal (0) or not (1)
% VN = variable that will enter the basis
% VNB = variable that will leave the basis
%--------------------------------------------------------------------------
% Output parameters:
%--------------------------------------------------------------------------
% -
%--------------------------------------------------------------------------
function Present_Simplex_tableau(n,m,c,xB,cB,A,b,zjcj,z,iteration,flag,VB,VNB)
    
    fprintf('Iteration #:\n',iteration)
    
    fprintf('\n')
    for i=1:15
        fprintf(' ');
    end
    for j=1:n+m
        fprintf('%-10.1f',c(j))
    end
    fprintf('\n')
    for i=1:15
        fprintf(' ');
    end
    for j=1:n+m
        fprintf('x%-9.0f',j)
    end
    fprintf('b\n')
    for i=1:15
        fprintf('-');
    end
    for j=1:(n+m+1)*10
        fprintf('-')
    end
    fprintf('\n')
    for i=1:m
        fprintf('x%-3.0f%-11.1f',xB(i),cB(i))
        for j=1:n+m
            fprintf('%-10.1f',A(i,j))
        end
        fprintf('%-10.1f\n',b(i))
    end
    for i=1:15
        fprintf('-');
    end
    for j=1:(n+m+1)*10
        fprintf('-')
    end
    fprintf('\n')
    fprintf('zj-cj')
    for i=1:10
        fprintf(' ');
    end
    for j=1:n+m
        fprintf('%-10.1f',zjcj(j))
    end
    fprintf('%-10.1f\n\n',z)
    
    if flag
        fprintf('Variable that will enter the basis -> x%d\n',VB)
        fprintf('Variable that will leave the basis -> x%d\n\n\n',VNB) 
    end
end
