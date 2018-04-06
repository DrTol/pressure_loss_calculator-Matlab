function f = f_ColebrookWhite(D,Re,aRou,fTol,MaxIter)
%% Calculates the Darcy-Weisbach friction factor for pressure loss calculations
%   via solving the implicit Colebrook&White expression, details in https://doi.org/10.1098/rspa.1937.0150
%   by Tol,Hakan Ibrahim from the PhD study at Technical University of Denmark 
%   PhD Topic: District Heating in Areas with Low-Energy Houses

%% DESCRIPTION
%   INPUTS (scalar or vector)
%    aRou     : Absolute roughness of pipe          [mm]
%    D        : Inner diameter of the pipe          [mm]
%    Re       : Reynolds Number                     [-]

%   INPUTS (scalar)
%    fTol     : Termination Tolerance(Iteration)    [-]
%    MaxIter  : Max. limit (Iteration)              [-]

%   OUTPUTS
%    f        : Friction factor (scalar or vector)  [-]
%    tElapsed : Elapsed time (scalar)               [s]

%% Initializing the Iteration
err=10;     % Iteration error 
IterNum=0;  % Iteration steps number

%  Initial estimate 
x0=f_SwameeJain(Re,aRou/D);

% Fasten your seat belts, iteration starts
while err>fTol & IterNum<MaxIter | isnan(x1) | ~isreal(x1) | isinf(x1)
    IterNum=IterNum+1;
    x1 = (2.*log10((aRou./D)./3.7+2.51./(Re.*sqrt(x0)))).^(-2);
    err=abs(x1-x0);
    x0=x1;
end

f=x1;

end
