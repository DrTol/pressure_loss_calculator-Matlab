function Re=tReynolds(mFlow,D,T)
%% Calculates the Reynolds Number for a circular pipe (water)

%%  Description
%  INPUTS (scalar or vector)
%   MF  : Mass flow                     [kg/s]
%   D   : Inner diameter of the pipe	[mm]
%   T   : Temperature of the water      [°C]

global P

Re=4*mFlow./(pi*(D/1000).*XSteam('my_pT',P,T));

end