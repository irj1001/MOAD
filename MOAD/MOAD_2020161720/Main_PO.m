%Irene Ruiz Juez
%2020161720
clc;clear;
while true
    op=menu('MAIN MENU','1 - Solve a new problem using the Simplex method','2 - Upload data of an already optimized problem','3 - Pure Integer Programming','4 - Exit');
    if op==1
        %---------------------------------------------------------------
        % Main program
        %---------------------------------------------------------------
        clc,clear;
        disp('----------------------------------------------------------')
        disp(' Solving a problem by the Simplex method ')
        disp('----------------------------------------------------------')
        disp(' It is assumed that: ')
        disp(' -> Objective function is in the maximization form')
        disp(' -> All constraints are of type ">=" ')
        disp(' -> All variables are >=0 ')
        disp('----------------------------------------------------------')
        
        % Asks for problem data
        [n,m,c,A,b]=Get_data;
        % Convert problem to standard form
        %[c,A,b]=Convert(n,m,c,A,b)
        % Initialize variables
        [A,c,b,x,xB,cB,SBA,zjcj]=Inicializa(n,m,c,A,b);
        
        % Solve by simplex method
        [n,m,A,c,b,x,xB,cB,SBA,zjcj,z]=MSimplex(n,m,A,c,b,x,xB,cB,SBA,zjcj)
        
        % Present the optimal solution and the optimal value of z
        Present_final_results(n,m,SBA,z,1);
        
        %Ask the user if he wants to save the problem
         disp('----------------------------------------------------------')
        sav=input('Do you want to save the problem?(1-Yes/0-No):');
        if sav==1
            nomfich=input('Indicates the name of the file(without extension):','s');
            save(nomfich,'n','m','A','c','b','x','xB','cB','SBA','zjcj','z');
        end
        var=input('Press any key to continue...');
        clearvars var;
        disp('----------------------------------------------------------')
    elseif op==2
         disp('----------------------------------------------------------')
        disp('List of existing files:')
        disp('----------------------------------------------------------')
        dir
        fich=input('Indicate the name of the file:','s');
        load (fich);
        disp('Problem data loaded')
        var=input('Press any key to continue...');
        clearvars var;
         disp('----------------------------------------------------------')
    elseif op==3
         disp('----------------------------------------------------------')
        [n,m,A,c,b,x,xB,cB,SBA,zjcj,z]=Progint(n,m,A,c,b,x,xB,cB,SBA,zjcj,z);
         disp('----------------------------------------------------------')
    elseif op==4
        break;
    end
    
end