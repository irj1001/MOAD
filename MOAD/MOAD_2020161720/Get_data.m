%--------------------------------------------------------------------------
% Function that gets the problem data
%--------------------------------------------------------------------------
% Input parameters:
%--------------------------------------------------------------------------
% -
%--------------------------------------------------------------------------
% Output parameters:
%--------------------------------------------------------------------------
% n = number of variables
% m = number of constraints
% c = vector of the coefficients of the variables in the OF (1xn)
% A = matrix of technical coefficients (mxn)
% b = vector of terms independent of constraints (mx1)
%--------------------------------------------------------------------------
function [n,m,c,A,b]=Get_data()
    fprintf('\n-------------------- Data of the problem --------------------\n')
    n=input('Number of variables: ');
    m=input('Number of constraints: ');

    fprintf('\nCoefficients of the variables in the objective function\n');
    flg=0;
    while(~flg)
        c=input('Insert vector c[]:');
        if length(c)==n && isnumeric(c)
            flg=1;
        else
            disp('Dimension of the vector is incorrect!\n')
        end
    end
    
    fprintf('\nCoefficients of the variables in the constraints\n');
    while(flg)
        A=input('Insert matrix A[;]:');
        [row,col]=size(A);
        if row~=m || col~=n
            disp('Dimensions of the matrix are incorrect!\n')
        else
            flg=0;
        end
    end

    fprintf('\nIndependent terms of the constraints\n');
    while(~flg)
        b=input('Insert vector b[]:');
        if length(b)==m
            flg=1;
        else
            disp('Dimension of the vector is incorrect!\n')
        end
    end
    b=b'; % Transpose row vector to colums vector
end