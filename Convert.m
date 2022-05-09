function [c,A,b]=Convert(n,m,c,A,b) 
% Convert minimization into maximization 
c=-c; 
% Convert constraints from ">=" to "<=" 
b=-b; 
A=-A; 
end