%% Example_PressureLossCalculator (SI Units)
%   This script shows how to use the Matlab tool "Pressure loss calculator"
%  by Tol,Hakan Ibrahim from the PhD study at Technical University of Denmark 
%   PhD Topic: District Heating in Areas with Low-Energy Houses

%% Given Data
L=66;           % The length of the pipe segment                    [m]
mFlow=4.09;     % Mass flow of water                                [kg/s]
Din=70.3;       % Pipe inner diameter                               [mm]
aRou=0.1;       % Absolute roughness                                [mm]
T_DW=90;        % Water temperature for Darch-Weisbach equation     [°C] 
T_HW=10;        % Water temperature for Hazen-Williams equation     [°C]


%% Fasten your seat belts, the code is running!

%% Darcy-Weisbach
% Pressure loss by use of Darcy-Weisbach via solving implicit Colebrook-White algorithm
plDW_ColebrookWhite=PressureLossCalculator(L,Din,mFlow,T_DW,aRou,'Solver','Darcy-Weisbach','fAlgorithm','Colebrook-White','fTol',0.001,'MaxIterations',2000)

% Pressure loss by use of Darcy-Weisbach via Clamond algorithm
plDW_Clamond=PressureLossCalculator(L,Din,mFlow,T_DW,aRou,'Solver','Darcy-Weisbach','fAlgorithm','Clamond')

% Pressure loss by use of Darcy-Weisbach via Zigrang-Sylvester algorithm
plDW_ZigrangSylvester=PressureLossCalculator(L,Din,mFlow,T_DW,aRou,'Solver','Darcy-Weisbach','fAlgorithm','Zigrang-Sylvester')

%% Hazen-Williams
% Pressure loss by use of Hazen-Williams
plHazenWilliams=PressureLossCalculator(L,Din,mFlow,T_HW,aRou,'Solver','Hazen-Williams')
