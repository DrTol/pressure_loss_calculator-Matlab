function [C_or_rRou,minRe,maxRe]=tConverterRoughness(rRou_or_C,ConvertDir)
%% BiDirectional convertor tool for pipe roughness as 'e/D to C' or 'C to e/D' - rRou is relative roughness (e/D)
%   based on data given by Diskin,M.H. - The limits of applicability of the Hazen-Williams formula
%   The data by Diskin can be found in mat file 'dataHWlimitation.mat'
%  by Tol,Hakan Ibrahim from the PhD study at Technical University of Denmark 
%   PhD Topic: District Heating in Areas with Low-Energy Houses

%% DESRIPTION
%   INPUTS
%    rRou_C     : Relative roughness (eps/D) or roughness coefficient (C), used respectively in Darcy-Weisbach (DW) or Hazen-Williams (HW) formulations
%                 Depends on the user choice of the conversion direction
%    ConvertDir : Direction for conversion, as either 'rRou2C' for 'e/D to C' or 'C2rRou for 'C to e/D'

%   OUTPUTS
%    C_rRou     : Roughness coefficient (C) for HW or relative roughness (eps/D) for DW depending on the convert direction selected
%    minRe      : Limitations of HW method as minimum Reynolds number on the given roughness 
%    maxRe      : Limitations of HW method as maximum Reynolds number on the given roughness

%% Calculations as to the Direction of Conversion given as input 'rRou2C' or 'C2rRou'
load dataHWlimitation.mat 

switch ConvertDir
    case 'rRou2C' % C as a function of relative roughness rRou
        C_or_rRou=-147.120418481659.*rRou_or_C.^0.168899561932556+179.126967041124;
        % C=50-10*log(aRou/D); % Another option to calculate C from relative roughness by Sudarmaji 
        maxRe=interp1(limitationHW.rRou,limitationHW.maxRe,rRou_or_C);  
        minRe=interp1(limitationHW.rRou,limitationHW.minRe,rRou_or_C);
    case 'C2rRou' % rRou as a function of C
        C_or_rRou=interp1(limitationHW.Cmodified,limitationHW.rRou,rRou_or_C);
        maxRe=interp1(limitationHW.Cmodified,limitationHW.maxRe,rRou_or_C);
        minRe=interp1(limitationHW.Cmodified,limitationHW.minRe,rRou_or_C);
    otherwise
        disp('USERWarning: You must choose either -rRou2C- or -C2rRou- (Case Sensitive)')
        error('USERerror: Wrong value given for the convert direction')
end
end
