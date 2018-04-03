function f = f_Moody(D,Re,aRou)
%% Calculates the Darcy-Weisbach friction factor for pressure loss calculations
%   based on Moody correlation
%   by Tol,Hakan Ibrahim from the PhD study at Technical University of Denmark 
%   PhD Topic: District Heating in Areas with Low-Energy Houses

%% INPUTS (Scalar or Vector)
%    aRou     : Absolute roughness of pipe          [mm]
%    D        : Inner diameter of the pipe          [mm]
%    Re       : Reynolds Number                     [-]

%% Checking algorithm limitations
if Re<4000 | Re>5e8 
    error('Error: Moody algorithm is valid for a Reynold range as in 4000<Re<5e8')
end
if aRou/D>0.01 
    error('Error: Moody algorithm is valid for a relative roughness range as eps/D<0.01')
end

f=5.5e-3.*(1+(2e4.*(aRou./D)+1e6./Re).^(1/3));

end