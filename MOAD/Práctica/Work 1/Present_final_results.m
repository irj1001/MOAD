%--------------------------------------------------------------------------
% Function that presents the optimal solution and the optimal Z value
%--------------------------------------------------------------------------
% Input parameters:
%--------------------------------------------------------------------------
% n = number of variables
% m = number of restrictions
% z = OF value
% SBA = vector containing current SBA values
%--------------------------------------------------------------------------
% Output parameters:
%--------------------------------------------------------------------------
% -
%--------------------------------------------------------------------------
function Present_final_results(n,m,SBA,z)
    fprintf('\n=> Optimal tableau since there are no negative values in zj-cj row\n')
    fprintf('\nOptimal solution:\n')
    fprintf('-------------------------------\n')
    for j=1:n+m
        fprintf('\tx%d* = %.2f\n',j,SBA(j))
    end
    fprintf('\nOptimal value of z:\n');
    fprintf('-------------------------------\n')
    fprintf('\tz*=%.2f\n',z)
end
