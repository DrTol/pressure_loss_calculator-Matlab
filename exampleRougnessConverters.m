%% Example_RougnessConverter (SI Units)
%   This script shows how to use the Matlab tools, converting roughness matters.
%    (i) tConverterDW2HW.m and (ii) tConverterRoughness.m
%   by Tol,Hakan Ibrahim from the PhD study at Technical University of Denmark 
%    PhD Topic: District Heating in Areas with Low-Energy Houses

%% Given Data
D=70.3;         % Pipe inner diameter                   [mm]
aRou=0.01;      % Absolute roughness                    [mm]
T=55;           % Water temperature                     [°C]
mFlow=4.09;     % Mass flow of water                    [kg/s]
C=150;          % Hazen-Williams roughness coefficient  [-]

% Note: C=150 and aRou=0.01 as given for PEX material from literature.

%% Pre-Calculations - Function Input Arguments
rRou=aRou./D;               % Relative roughness       	[mm/mm]
Re=tReynolds(mFlow,D,T);    % Reynolds number           [-]

%% 01) tConverterRoughness.m 

% Convert from Hazen-Williams roughness coefficient (C) to pipe relative roughness (rRou)
[rRou_from_C_Diskin,~,~]=tConverterRoughness(C,'C2rRou')
aRou_from_C_Diskin=rRou_from_C_Diskin.*D

% Convert from pipe relative roughness (eps/D) to Hazen-Williams roughness coefficient (C)
[C_from_rRou_Diskin,~,~]=tConverterRoughness(rRou,'rRou2C')

C_from_rRou_Sudarmaji=50-10*log(rRou)

%% 02) tConverterDW2HW.m 

% Convert from Hazen-Williams roughness coefficient (C) to Darcy-Weisbach friction factor (f)
f_from_C_Liou = tConverterDW2HW(C,D,Re,T,'C2f')

% Convert from Darcy-Weisbach friction factor (f) to Hazen-Williams roughness coefficient (C)
f=f_Clamond(Re,rRou);
C_from_f_Liou = tConverterDW2HW(f,D,Re,T,'f2C')
