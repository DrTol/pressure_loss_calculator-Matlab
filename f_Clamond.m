function DWc = f_Clamond(R,K)
% DWc = COLEBROOK(R,K) fast, accurate and robust computation of the 
%     Darcy-Weisbach friction factor F according to the Colebrook equation:
%                             -                       -
%      1                     |    K        2.51        |
%  ---------  =  -2 * Log_10 |  ----- + -------------  |
%   sqrt(DWc)                |   3.7     R * sqrt(DWc)   |
%                             -                       -
% INPUT:
%   R : Reynolds' number (should be >= 2300).
%   K : Equivalent sand roughness height divided by the hydraulic 
%       diameter (default K=0).
%
% OUTPUT:
%   DWc : Darcy Weisbach Friction factor.
%
% FORMAT:
%   R, K and DWc are either scalars or compatible arrays.
%
% ACCURACY:
%   Around machine precision forall R > 3 and forall 0 <= K, 
%   i.e. forall values of physical interest. 
%
% EXAMPLE: DWc = colebrook([3e3,7e5,1e100],0.01)
%
% Edit the m-file for more details.

% Method: Quartic iterations.
% Reference: http://arxiv.org/abs/0810.5564 
% Read this reference to understand the method and to modify the code.

% Author: D. Clamond, 2008-09-16. 

% Check for errors.
if any(R(:)<2300) == 1, 
   warning('The Colebrook equation is valid for Reynolds'' numbers >= 2300.');      
end,
if nargin == 1 || isempty(K) == 1,      
   K = 0;
end,
if any(K(:)<0) == 1, 
   warning('The relative sand roughness must be non-negative.'); 
end,

% Initialization.
X1 = K .* R * 0.123968186335417556;              % X1 <- K * R * log(10) / 18.574.
X2 = log(R) - 0.779397488455682028;              % X2 <- log( R * log(10) / 5.02 );                   

% Initial guess.                                              
DWc = X2 - 0.2;     

% First iteration.
E = ( log(X1+DWc) - 0.2 ) ./ ( 1 + X1 + DWc );
DWc = DWc - (1+X1+DWc+0.5*E) .* E .*(X1+DWc) ./ (1+X1+DWc+E.*(1+E/3));

% Second iteration (remove the next two lines for moderate accuracy).
E = ( log(X1+DWc) + DWc - X2 ) ./ ( 1 + X1 + DWc );
DWc = DWc - (1+X1+DWc+0.5*E) .* E .*(X1+DWc) ./ (1+X1+DWc+E.*(1+E/3));

% Finalized solution.
DWc = 1.151292546497022842 ./ DWc;                      % DWc <- 0.5 * log(10) / DWc;
DWc = DWc .* DWc;                                    	% DWc <- Friction factor.
