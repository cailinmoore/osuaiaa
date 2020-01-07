%Injector Plate Calculations

clear
clc

%Using Chonkonite formula circa 09/27/2019

%%% Motor Characterization

OF=3;                %oxidizer to fuel ratio
massf=16.27;            %solid propellant mass (lbs)
massOX=50.25;           %liquid propellant mass (lbs)
t=9;                 %burn time (sec)
F = 125;             %thrust (lbf)
Isp = 230.1;         %specific impulse (sec)
g = 32.2*12;         %gravity (ft/sec^2)

%%%Initial Values

mf = massf/t;               %mass flow rate fuel (lbs/sec)
mOX = massOX/t;             %mass flow oxidizer (lbs/sec)
m = mOX + mf;               %total mass flow rate (lbs/sec)
Cd = 1;                     %discharge coefficient standford study
A = 4.75;                   %area injector plate (in^2)
D = sqrt(A/pi)*2;
denOX =0.03323711;          %density of liquid n2o (lbs/in^3) based on temperature of 0 deg celcius
                            %most uncertainty

Pfwd= 700;                  %pressure at forward enclosure (psi)
Pcc = 300;                  %operating combustion chamber pressure (psi)
deltaP = abs(Pfwd - Pcc);   %pressure drop over injector (psi)
dhole = 1/16;              %diameter of holes (in)
Ahole= pi*((dhole/2)^2);

%% Calculating Orifice Diameter
% %X = 
FN = mOX/ sqrt(deltaP * denOX); 
% D = 2*sqrt(FN/(pi*(1-X)*sqrt(2)));

Ninj = mOX/(Cd*Ahole*sqrt(2*denOX*deltaP)); %number injectors

THoles = Ninj*Ahole;

pdi = sqrt(THoles/pi)*2; 

fprintf('With a hole diameter of %0.3f inches, we will need %0.0f holes.\n', dhole, Ninj)
fprintf('Total hole area %0.3f in^2.\n', THoles)
fprintf('Diameter of plumbing should be close to %0.3f in.\n', pdi)

