function C_or_f = tConverterDW2HW(f_or_C,D,Re,T,ConvertDir)
%% Converts the Darcy-Weisbach friction factor (f) to Hazen-Williams pipe roughness coefficient (C) 
%   formulation based on expression given by Liou 
%   https://doi.org/10.1061/(ASCE)0733-9429(1998)124:9(951)
%  by Tol,Hakan Ibrahim from the PhD study at Technical University of Denmark 
%   PhD Topic: District Heating in Areas with Low-Energy Houses

%% NOTE
%   Hazen-Williams roughness coefficient C is defined as constant at 150 for PEX Ref: REHAU, Committee report (2012)
%   Here the idea is to provide a dynamically changing C as to the f (not constant C)

%% INPUTS (scalar or vector)
%   f        : Darcy-Weisbach fricton factor  [-]
%   D        : Inner diameter of the pipe     [mm]
%   aRou     : Absolute roughness             [mm]
%   Re       : Reynolds Number                [-]
%   T        : Temperature                    [ºC]

%% Fasten your seat belts
%   Converting dynamic viscosity to kinematic viscosity

kVisco=XSteam('my_pT',8,T)./XSteam('rhoL_T',T); % as dynamic viscosity/density [m2/s] for a static pressure of 8 bar.

switch ConvertDir
    case 'f2C'
        C_or_f=1/((5*D.^(79/5000).*Re.^(37/250).*f_or_C.*kVisco.^(37/250))./669).^(20/37);
    case 'C2f'
        C_or_f=669/(5*f_or_C.^(37/20).*D.^(79/5000).*Re.^(37/250).*kVisco.^(37/250));
    otherwise
        disp('USERWarning: You must choose either -f2C- or -C2f- (Case Sensitive)')
        error('USERerror: Wrong value given for the convert direction')
end
end

