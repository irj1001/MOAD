function [n,m,A,c,b,x,xB,cB,SBA,zjcj,z]=MSimplex(n,m,A,c,b,x,xB,cB,SBA,zjcj)

%Clear command window
clc

termina=0;  % Variable that controls the "while" loop
iteracao=0; % Iterations counter

while ~termina   % While termina equals zero
    % Calculate row zj-cj
    for j=1:n+m
        zjcj(j)=cB'*A(:,j)-c(j);
    end
    % Calculate value of z
    z=cB'*b;
    % Test if the solution is optimal
    [valor_min,coluna_pivot]=min(zjcj);
    if valor_min>=0
        termina=1;
        Present_Simplex_tableau(n,m,c,xB,cB,A,b,zjcj,z,iteracao,0,0,0)
       
    else
        % Calculate quoccients between values of b column and pivot column
        q=realmax*ones(m,1);
        for i=1:m
            if A(i,coluna_pivot)>0
                q(i)=b(i)/A(i,coluna_pivot);
            end
        end
        % Find pivot row
        [valor_min,linha_pivot]=min(q);
        % Present Simplex tableau
        Present_Simplex_tableau(n,m,c,xB,cB,A,b,zjcj,z,iteracao,1,x(coluna_pivot),xB(linha_pivot))
        pause
        % Update basis
        xB(linha_pivot)=x(coluna_pivot);
        cB(linha_pivot)=c(coluna_pivot);
        % Perform linear operations over the rows
        % Transform pivot element into 1
        k=1/A(linha_pivot,coluna_pivot); % Inverse of pivot element
        A(linha_pivot,:)=k*A(linha_pivot,:);
        b(linha_pivot)=k*b(linha_pivot);
        % Delete remaining elements of pivot column
        for i=1:m
            if i~=linha_pivot
                k=A(i,coluna_pivot);
                A(i,:)=A(i,:)-k*A(linha_pivot,:);
                b(i)=b(i)-k*b(linha_pivot);
            end
        end
        % Update feasible basic solution (SBA)
        for j=1:n+m
            linha_base=find(xB==j); % Index of the variable in the basis
            if isempty(linha_base)  % Variable is not in the basis
                SBA(j)=0;
            else
                SBA(j)=b(linha_base); % Variable belongs to the basis
            end
        end
    end
    iteracao=iteracao+1;
end
