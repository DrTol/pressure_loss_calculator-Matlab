# Pressure Loss Calculator Tool - Matlab (SI Units)
A Matlab tool calculating the friction pressure loss (head loss) in circular pipes with full flow water, as well useful to compare different solver types or friction factor algorithms (details given in [Features](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/README.md#features)). 

This Matlab tool is a by-product from the PhD study about the 4th generation (4G) low-temperature district heating systems in supply to low-energy houses, carried out by Hakan İbrahim Tol, PhD under the supervision of Prof. Dr. Svend Svendsen and Ass. Prof. Susanne Balslev Nielsen at the Technical University of Denmark (DTU). The PhD topic: "District heating in areas with low energy houses - Detailed analysis of district heating systems based on low temperature operation and use of renewable energy" - [free download by DTU (link)](http://orbit.dtu.dk/en/publications/district-heating-in-areas-with-low-energy-houses(9c056db5-8e76-425f-92ca-c072b642b6b3).html) or [by ResearchGate (link)](https://www.researchgate.net/publication/276266953_District_heating_in_areas_with_low_energy_houses_-_Detailed_analysis_of_district_heating_systems_based_on_low_temperature_operation_and_use_of_renewable_energy).

## Features
- This Matlab tool has the options in selecting the solver type through the equations either by 'Darcy-Weisbach' or by 'Hazen-Williams'. 
- Besides, another feature in the tool options allows users to select through various algorithms to calculate the Darcy-Weisbach friction coefficient *f*, limited to algorithms by 'Moody', 'Colebrook-White', 'Clamond', 'Swamee-Jain', 'Zigrang-Sylvester', and 'Haaland'. 
- Aside from the main Matlab tool, two other converter tools are also given to obtain the Hazen-Williams roughness coefficient *C* as a non-steady variable by a function of (i) the absolute roughness of the pipe (also known as ε - eps) and (ii) the Darcy-Weisbach friction factor *f*.
- The limitations for use of equations and algorithms are given in the code (e.g. the operational limitations in using Hazen-Williams).

## Table of Contents
  - [How2Use](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/README.md#How2Use)
  - [How2Cite](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/README.md#how2cite)
  - [References](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/README.md#references)

# How2Use
Example scripts are given to illustrate how to use the tools developed. 
1. [examplePressureLoss.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/examplePressureLoss.m): shows how to use the main Matlab tool [PressureLossCalculator.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/PressureLossCalculator.m) with a given data for a pipe segment with different combinations of the solver and the Darcy-Weisbach friction factor algorithms (details given in [Features](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/README.md#features)).
2. [exampleRougnessConverters.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/exampleRougnessConverters.m): shows how to use the Matlab converter tools with bi-directional examples of use (e.g. conversion of relative pipe roughness (eps/D) to Hazen-Wiliams rougness coefficient (C) as well as conversion from C to eps/D). There are two converter tools: 
   - [tConverterDW2HW.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/tConverterDW2HW.m): Bi-directional converter between the Hazen-Williams roughness coefficient (C) and the Darcy-Weisbach friction factor (f). 
   - [tConverterRoughness.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/tConverterRoughness.m): Bi-directional converter between the pipe relative roughness (eps/D) to Hazen-Williams roughness coefficient (C).
3. **Darcy-WeisbachFrictionFactors**: Various Matlab functions can be found for various algorithms, details given below. How2Use each of them can be found in the last section (within switch-case there) of the [PressureLossCalculator.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/PressureLossCalculator.m). 
   - [f_Moody.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/f_Moody.m): as based on Moody correlation.
   - [f_ColebrookWhite.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/f_ColebrookWhite.m): Iterative solution of the implicit Colebrook's friction factor expression.
   - [f_Clamond.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/f_Clamond.m): The explicit approximation (of the Colebrook's friction factor expression) by Clamond D. This original work is taken from [Clamond D. Mathworks File Exchange: colebrook.m (link)](https://nl.mathworks.com/matlabcentral/fileexchange/21990-colebrook-m?focused=5105324&tab=function).
   - [f_Haaland.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/f_Haaland.m): Another explicit approximation by Haaland SE. 
   - [f_SwameeJain.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/f_SwameeJain.m): Another explicit approximation by Swamee P&Jain A.
   - [f_ZigrangSylvester.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/f_ZigrangSylvester.m): Another explicit approximation by Zigrang DJ&Sylvester ND.
4. [XSteam.m](https://github.com/DrTol/pressure_loss_calculator-Matlab/blob/master/XSteam.m): Matlab tool used to obtain the thermodynamic properties of water in calculations. This original work is taken from [Holmgren M. MathWorks File Exchange: XSteam.m (link)](https://nl.mathworks.com/matlabcentral/fileexchange/9817-x-steam--thermodynamic-properties-of-water-and-steam). 

# Contributing 
Describe how other developers can help

# License
You are free to use, modify and distribute the code as long as authorship is properly acknowledged. The same applies for the original works 'XSteam.m' by Holmgren M. and 'colebrook.m' by Clamond D.

# Acknowledgement 
We would like to acknowledge all of the open-source minds in general for their willing of share (as apps or comments/answers in forums), which has encouraged our department to publish our Matlab tools developed during the PhD study here in GitHub.

This repository *pressure_loss_calculator-Matlab* makes use of other original open-source projects: 
- [XSteam by Holmgren M.](https://nl.mathworks.com/matlabcentral/fileexchange/9817-x-steam--thermodynamic-properties-of-water-and-steam) | Author Description: XSteam provides accurate steam and water properties from 0 - 1000 bar and from 0 - 2000 deg C according to the standard IAPWS IF-97. For accuracy of the functions in different regions see IF-97 (www.iapws.org).
- [colebrook.m by Clamond D.](https://nl.mathworks.com/matlabcentral/fileexchange/21990-colebrook-m?focused=5105324&tab=function) | Author Description: fast, accurate and robust computation of the Darcy-Weisbach friction factor F according to the Colebrook equation. 

# How2Cite:
1. Tol, Hİ. pressure_loss_calculator-Matlab. GitHub Repository 2018; https://github.com/DrTol/pressure_loss_calculator-Matlab/
2. Tol, Hİ. District heating in areas with low energy houses - Detailed analysis of district heating systems based on low temperature operation and use of renewable energy. PhD Supervisors: Svendsen S. & Nielsen SB. Technical University of Denmark 2015; 204 p. ISBN: 9788778773685.

# References
- Sanks RL. Flow in conduits. In: Sanks RL, Tchobanoglous G, Bosserman BE, Jones GM, editors. Pumping station design. Boston, USA: Butterworth-Heinemann; 1998. p. 33-39.
- Clamond D. Efficient resolution of the colebrook equation. Industrial & Engineering Chemistry Research 2009;48: p. 3665-3671.
- Clamond D. colebrook.m - Efficient resolution of the Colebrook-White equation (v1.0). MathWorks File Exchange: https://nl.mathworks.com/matlabcentral/fileexchange/21990-colebrook-m?focused=5105324&tab=function
- Diskin MH. The limits of applicability of the Hazen-Williams formula. La Houille Blanche 1960;6: p. 720-726.
- Liou CP. Limitations and proper use of the Hazen-Williams equation. Journal of Hydraulic Engineering 1998; 124(9): p. 951-954.
- Colebrook CF. & White CM. Experiments with fluid friction in roughened pipes. Proceedings of the Royal Society A - Mathematical, Physical & Engineering Sciences 1937; p. 367-381.
- Asker M.,Turgut OE.& Coban MT. A review of non iterative friction factor correlations for the calculation of pressure drop in pipes. Bitlis Eren Univ J Sci & Technol 2014; 4(1): 8 p. 
- Genić S.,Arandjelović I.,Kolendić P.,Jarić M.,Budimir N.&Genić M. A Review of explicit approximations of Colebrook’s equation. FME Transactions 2011; 39: p. 67-71.  
