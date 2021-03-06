clear

[solversToUse] = prepareTest(requireOneSolverOf,{'gurobi','ibm_cplex');

printLevel=1;
solverOK = changeCobraSolver('ibm_cplex','LP');
modelToLoad='Recon3D';

switch modelToLoad
    case 'Recon3D'
        load('Recon3D_301.mat')
    case 'Recon2betaModel'
        %graphStoich/data/modelCollection/121114_Recon2betaModel.mat
        load 121114_Recon2betaModel.mat
        model=modelRecon2beta121114;
    case 'KEGGMatrix'
        load ~/work/modeling/projects/graphStoich/data/modelCollectionBig/KEGGMatrix.mat
        model=KEGG;
end

%finds the exchange reactions
model=findSExRxnInd(model);

[nMet,nIntRxn]=size(model.S(:,model.SIntRxnBool));
m=sparse(nMet,15);
i=1;

if 1
    if 1
        %by default, the check for stoichiometric consistency omits the columns
        %of S corresponding to exchange reactions
        clear method
        method.interface='solveCobraLP';
        method.solver='gurobi5';
        method.param.Method=1;
        [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel,method);
        i=i+1;
    end
    
    if 1
        %by default, the check for stoichiometric consistency omits the columns
        %of S corresponding to exchange reactions
        clear method
        method.interface='solveCobraLP';
        method.solver='gurobi5';
        method.param.Method=2;
        [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel,method);
        i=i+1;
    end
    
    if 1
        %by default, the check for stoichiometric consistency omits the columns
        %of S corresponding to exchange reactions
        clear method
        method.interface='solveCobraLP';
        method.solver='gurobi5';
        method.param.Method=3;
        [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel,method);
        i=i+1;
    end
    
    if 1
        %by default, the check for stoichiometric consistency omits the columns
        %of S corresponding to exchange reactions
        clear method
        method.interface='solveCobraLP';
        method.solver='gurobi5';
        method.param.Method=4;
        [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel,method);
        i=i+1;
    end
    
    if 0
        %by default, the check for stoichiometric consistency omits the columns
        %of S corresponding to exchange reactions
        clear method
        method.interface='solveCobraLP';
        method.solver='mosek_linprog';
        [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel,method);
        i=i+1;
    end
    
    if 0
        %by default, the check for stoichiometric consistency omits the columns
        %of S corresponding to exchange reactions
        clear method
        method.interface='solveCobraLP';
        method.solver='mosek';
        method.param.MSK_IPAR_OPTIMIZER='MSK_OPTIMIZER_PRIMAL_SIMPLEX';
        [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel,method);
        i=i+1;
    end
    
    if 0
        %by default, the check for stoichiometric consistency omits the columns
        %of S corresponding to exchange reactions
        clear method
        method.interface='solveCobraLP';
        method.solver='mosek';
        method.param.MSK_IPAR_OPTIMIZER='MSK_OPTIMIZER_DUAL_SIMPLEX';
        [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel,method);
        i=i+1;
    end
    
    if 0 %still debugging this solve with Erling @ Mosek
        %by default, the check for stoichiometric consistency omits the columns
        %of S corresponding to exchange reactions
        clear method
        method.interface='solveCobraLP';
        method.solver='mosek';
        method.param.MSK_IPAR_OPTIMIZER='MSK_OPTIMIZER_INTPNT';
        printLevelZ=3;
        [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevelZ,method);
        i=i+1;
    end
end

if 1
    clear method
    method.interface='solveCobraLP';
    method.solver='ibm_cplex';
    [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel+1,method);
    i=i+1;
end

if 0
    clear method
    method.interface='solveCobraLP';
    method.solver='pdco';
    [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel+1,method);
    i=i+1;
end

if 0
    clear method
    method.interface='cvx';
    method.solver='gurobi';
    [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel,method);
    i=i+1;
end

if 0
    clear method
    method.interface='cvx';
    method.solver='mosek';
    [inform(i),m(:,i),models{i}]=checkStoichiometricConsistency(model,printLevel,method);
    i=i+1;
end

m=full(m);



       