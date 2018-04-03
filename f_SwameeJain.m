function f = f_SwameeJain(D,Re,aRou)
%% Calculates the Darcy-Weisbach friction factor for pressure loss calculations
%   via explicit equation by Swamee,P.K.&Jain,A.K.
%   by Tol,Hakan Ibrahim from the PhD study at Technical University of Denmark 
%   PhD Topic: District Heating in Areas with Low-Energy Houses

%% INPUTS (Scalar or Vector)
%    aRou     : Absolute roughness of pipe          [mm]
%    D        : Inner diameter of the pipe          [mm]
%    Re       : Reynolds Number                     [-]

%% Checking algorithm limitations
if Re<5000 | Re>1e8 
    error('Error: Swamee&Jain algorithm is valid for a Reynold range as in 5000<Re<1e8')
end
if aRou/D<1e-6 | aRou/D>0.05 
    error('Error: Swamee&Jain algorithm is valid for a relative roughness range as in 1e-6<eps/D<0.05')
end

%% Fasten your seat belts
f=0.25./(log10((aRou./D)./3.7+5.74./Re.^0.9)).^2;

end

