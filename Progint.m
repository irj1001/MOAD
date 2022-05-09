function [n,m,A,c,b,x,xB,cB,SBA,zjcj,z]=Progint(n,m,A,c,b,x,xB,cB,SBA,zjcj,z)
flag=true;


for i=1:n
    if ((ceil(SBA(i)))>SBA(i))
        
        flag=false;
    end
end

if flag==true
    disp('The solution for the PILP problem is the same as the solution to the LP problem')
    Present_final_results(n,m,SBA,z,1);
    
else
    while flag==false
        disp('There are original variables with a fractional value')
        disp('---> A cutting constraint must be introduced')
        disp('and the new problem solved by the dual Simplex method')
        %Choose the row
        s=1;
        fs0=(mod(b(s),1));
        for i=1:size(b)
            if (mod(b(i),1))~=0
                if (mod(b(i),1))>(mod(b(s),1))
                    s=i;
                    fs0=(mod(b(s),1));
                end
            end
        end
        
        %Initialize the constraint
        clear constraint;
        constraint=zeros(1,n+m);
        
        %calculate xsj
        for j=1:n+m
            if SBA(j)==0
                xsj=mod(A(s,j),1);
                if xsj<0
                    xsj=1-xsj;
                end
                constraint(j)=xsj;
            end
        end
        %transform the constraint to <=
        
        constraint=-constraint;
        fs0=-fs0;
       
        
        A=[A ;constraint];
        
        %increase number of restrictions
        m=m+1;
        %create new column of A and update variables
       
        newcolumn=zeros(1,m+n-2);  
        
        A=[A newcolumn'];
        
        A(m,n+m)=1;
        b=[b;fs0];
        c=[c 0];

        SBA=[SBA;0];
        
        zjcj=[zjcj 0];
        xnew=[n+m]
        x=[x xnew];
        cB=[cB;0];
        xB=[xB;xnew];
        
        
        %Dual simplex
        [n,m,A,c,b,x,xB,cB,SBA,zjcj,z]=MDSimplex(n,m,A,c,b,x,xB,cB,SBA,zjcj);
        
        Present_final_results(n,m,SBA,z,1);
        
        flag=true;
        for i=1:n
            if ((ceil(SBA(i)))>SBA(i))
                
                flag=false;
            end
        end

       
    end
end

end

