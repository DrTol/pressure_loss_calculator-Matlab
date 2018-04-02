%% Example_Single - based for a given data

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
plDW_CW=PressureLossCalculator(L,Din,mFlow,T_DW,aRou,'Solver','Darcy-Weisbach','fAlgorithm','Colebrook-White','fTol',0.001,'MaxIterations',2000)

% Pressure loss by use of Darcy-Weisbach via Clamond algorithm
plDW_Cl=PressureLossCalculator(L,Din,mFlow,T_DW,aRou,'Solver','Darcy-Weisbach','fAlgorithm','Clamond')

% Pressure loss by use of Darcy-Weisbach via Zigrang-Sylvester algorithm
plDW_ZS=PressureLossCalculator(L,Din,mFlow,T_DW,aRou,'Solver','Darcy-Weisbach','fAlgorithm','Zigrang-Sylvester')

%% Hazen-Williams
% Pressure loss by use of Hazen-Williams
plHW=PressureLossCalculator(L,Din,mFlow,T_HW,aRou,'Solver','Hazen-Williams')