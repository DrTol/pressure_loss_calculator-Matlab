# Pressure Loss Calculator Tool - Matlab
A Matlab tool calculating the friction pressure loss in circular pipes with full flow water, as well useful to compare different solver types or friction factor algorithms (details given in [Features](#Features)). 

This Matlab tool is a by-product from the PhD study about the 4th generation (4G) low-temperature district heating systems in supply to low-energy houses, carried out by Hakan İbrahim Tol, PhD under the supervision of Prof. Dr. Svend Svendsen and Ass. Prof. Susanne Balslev Nielsen at the Technical University of Denmark (DTU). The PhD topic: "District heating in areas with low energy houses - Detailed analysis of district heating systems based on low temperature operation and use of renewable energy" - [free download by DTU (link)](http://orbit.dtu.dk/en/publications/district-heating-in-areas-with-low-energy-houses(9c056db5-8e76-425f-92ca-c072b642b6b3).html) or [by ResearchGate (link)](https://www.researchgate.net/publication/276266953_District_heating_in_areas_with_low_energy_houses_-_Detailed_analysis_of_district_heating_systems_based_on_low_temperature_operation_and_use_of_renewable_energy).

## Features
- This Matlab tool has the options in selecting the solver type through the equations either by 'Darcy-Weisbach' or by 'Hazen-Williams'. 
- Besides, another feature in the tool options allows users to select through various algorithms to calculate the Darcy-Weisbach friction coefficient *f*, limited to algorithms by 'Moody', 'Colebrook-White', 'Clamond', 'Swamee-Jain', 'Zigrang-Sylvester', and 'Haaland'. 
- Aside from the main Matlab tool, two other converter tools are also given to obtain the Hazen-Williams roughness coefficient *C*, one from the absolute roughness of the pipe (also known as ε - eps) and the other from the Darcy-Weisbach friction factor *f*, SO maintaining a nonsteady *C*.
- The limitations for use of equations and algorithms are given in the code (e.g. the operational limitations in using Hazen-Williams).

# Table of Contents
- [Usage](#Usage)
- [References](#References)

# Usage
: Describe how to use the matlab files

Contributing: Describe how other developers can help

Credits
License
Acknowledgement: XSteam, Clamond, Matlab forum sites
# How2Cite:
Please cite as: Tol, Hİ. pressure_loss_calculator-Matlab. GitHub Repository 2018; https://github.com/DrTol/pressure_loss_calculator-Matlab/

# References

- Sanks RL. Flow in conduits. In: Sanks RL, Tchobanoglous G, Bosserman BE, Jones GM, editors. Pumping station design. Boston, USA: Butterworth-Heinemann; 1998. p. 33-39.
- Clamond D. Efficient resolution of the colebrook equation. Industrial & Engineering Chemistry Research 2009;48:3665-3671
