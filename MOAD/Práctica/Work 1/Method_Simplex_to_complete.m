%--------------------------------------------------------------------------
%               Implementation of the Simplex Method 
%--------------------------------------------------------------------------
% Main variables:
%--------------------------------------------------------------------------
% n = number of original variables
% m = number of functional restrictions
% A = matrix of technical coefficients
% b = vector of terms independent of constraints
% c = vector of coefficients of variables in OF
% x = vector with indexes of all variables
% xB = vector with indexes of basic variables
% cB = vector with the coefficients of the basic variables in the OF
% zjcj = vector with zj-cj row values
% z = OF value
% SBA = vector with the values of the feasible basic solution in each
%       iteration
%------------------------------------------------------------------------- 
