function PL=PressureLossCalculator(L,D,mFlow,T,aRou,varargin)
%% Pipe pressure loss calculator for a circular pipe, full flow water (SI Units)
%   by Tol,Hakan Ibrahim from the PhD study at Technical University of Denmark 
%   PhD Topic: District Heating in Areas with Low-Energy Houses

%% DESCRIPTION
%   Inputs
%    L     : Length of the pipe segment    [m]
%    D     : Inner Diameter of the pipe    [mm]
%    aRou  : Absolute Roughness of pipe    [mm]
%    mFlow : Mass Flow                     [kg/s]
%    T     : Temperature                   [ºC]

%   Name/Value Pairs to be defined in Varargin
%    'Solver' to select through 'Darcy-Weisbach' or 'Hazen-Williams' formulations to calculate pipe pressure loss
%    'fAlgorithm' to select through implicit 'Colebrook-While' or explicit algorithms such as 'Clamond', 'Swamee-Jain' etc. to calculate Darcy-Weisbach friction factor
%    'fTol' the value for iteration tolerance to be used in 'Colebrook-White' algorithm
%    'MaxIterations' maximum limit for the iteration steps to be used in 'Colebrook-White' algorithm

%   Output
%    PL    : Pressure Loss                 [bar]

%% List of Solvers and Friction Coefficient Algorithms, considered
Solvers = {'Hazen-Williams','Darcy-Weisbach'};
fAlgorithms={'Moody','Colebrook-White','Clamond','Swamee-Jain','Zigrang-Sylvester','Haaland'};
List=struct('Solver',{Solvers},'fAlgorithm',{fAlgorithms});
listNames=fieldnames(List);

%% Solver&Algorithm Options - Name/Value Pairs
%  Thanks to Jonas and Robert Cain for the explanation of Name/Value Pair in 
%  https://stackoverflow.com/questions/2775263/how-to-deal-with-name-value-pairs-of-function-arguments-in-matlab

%  Default options (set to): Solver as Darcy-Weisbach with friction algorithm as Clamond
options = struct('Solver','Darcy-Weisbach','fAlgorithm','Clamond','fTol',0.001,'MaxIterations',2000);
optionNames = fieldnames(options);

%  Update options as to the user input (dealing vargin)
for pair = reshape(varargin,2,[])
    inpName = pair{1};
    if any(strcmp(inpName,optionNames))
        if any(strcmp(inpName,listNames))
            if any(ismember(List.(inpName),pair{2}))
                options.(inpName) = pair{2};
            else
                disp(['Warning: Available Values for Parameter -' num2str(inpName) '- are:'])
                disp(getfield(List, inpName))
                error('Error: Wrong parameter value: %s',char(pair{2}))
            end
        end
    else
      disp('Warning: Available Parameter Names:')
      disp(optionNames)
      error('Error: Wrong parameter name: %s',inpName)
    end
end

%% Fasten your seat belts, Calculation on Progress

global P
P=8; %[bar] - pressure with arbitrary selection 

% Calculates Reynolds Number and volumetric flow
Re=tReynolds(mFlow,D,T);
vFlow=mFlow./XSteam('rhoL_T',T);

switch options.('Solver')
    case 'Hazen-Williams'
        %% Limitations of Hazen-Williams equation
        
        %   limitation for Pipe inner diameter
        if D<50 | D>1850 
            error('Error: Hazen-Williams equation is valid for diameter range as in 0.05<D<1.85 m')
        end
        
        %   limitation for Water Temperature
        %   (Hazen-Williams is valid for ordinary water temperature at i.e. 15 °C) - Ref: https://www.shf-lhb.org/articles/lhb/pdf/1960/08/lhb1960059.pdf
        if T>15
            disp('Warning: Hazen-Williams equation is valid at a temperature range of 4-15 °C')
            error('Error: so not suitable for District/Community Heating applications')
        end
        
        %  limitation for Reynolds  
        %   Reynolds limitations (as minimum and as maximum) varies as to the pipe roughness- Ref: Diskin
        
        [C,minRe,maxRe]=tConverterRoughness(aRou/D,'rRou2C'); % C is the Hazen-Williams pipe roughness constant - obtained as a function of relative roughness (aRou/D)
        
        if Re<minRe | Re>maxRe
            error('Warning: Hazen-Williams equation is valid for Reynolds range as in %d<Re<%d for the case of relative roughness at %d',minRe,maxRe, aRou/D)
        end
        
        %% Calculates the pipe pressure loss for a pipe segment at a length of L via Hazen-Williams
        
        PL=(L.*(vFlow./(0.278*C.*(D/1000).^2.63)).^1.85185)*0.09807; 
        
    case 'Darcy-Weisbach'
        
        if Re<2300
            fDW=64/Re;
        else % including transition and complete turbulence regions
            switch options.('fAlgorithm')
                case 'Colebrook-White'
                    fDW=f_ColebrookWhite(D,Re,aRou,options.('fTol'),options.('MaxIterations'));
                case 'Moody'
                    fDW=f_Moody(D,Re,aRou);
                case 'Clamond'
                    fDW=f_Clamond(Re,aRou/D);
                case 'Swamee-Jain'
                    fDW=f_SwameeJain(D,Re,aRou);
                case 'Zigrang-Sylvester'
                    fDW=f_ZigrangSylvester(D,Re,aRou);
                case 'Haaland'
                    fDW=f_Haaland(D,Re,aRou);
            end
        end
        
        PL=(8*fDW.*L.*mFlow.^2./(pi^2*XSteam('rhol_T',T).^2*9.81.*(D/1000).^5))./10.1971621297792;
end

end

    