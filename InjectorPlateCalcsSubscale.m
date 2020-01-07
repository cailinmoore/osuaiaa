%Injector Plate Calculations

clear
clc

%Using Chonkonite formula circa 09/27/2019

%%% Motor Characterization

OF=3;                %oxidizer to fuel ratio
massf=20;            %solid propellant mass (lbs)
massOX=42;           %liquid propellant mass (lbs)
t=9;                 %burn time (sec)
F = 125;             %thrust (lbf)
Isp = 230.1;         %specific impulse (sec)
g = 32.2*12;         %gravity (ft/sec^2)

%%%Initial Values

mf = massf/t;               %mass flow rate fuel (lbs/sec)
mOX = massOX/t;             %mass flow oxidizer (lbs/sec)
%mdot = denOX*(pi*0.75^2)*
m = mOX + mf;               %total mass flow rate (lbs/sec)
Cd = 0.8;                   %discharge coefficient standford study
di = 6;                  %injector plate (in)
A = (di/2)^2*pi;            %area injector plate (in^2)
denOX =0.03323711;          %density of liquid n2o (lbs/in^3) based on temperature of 0 deg celcius
                            %most uncertainty
Pfwd= 740;                  %pressure at forward enclosure (psi)
Pcc = 400;                  %operating combustion chamber pressure (psi)
deltaP = abs(Pfwd - Pcc);   %pressure drop over injector (psi)
dhole = 0.125;             %diameter of holes (in)
Ahole= pi*((dhole/2)^2);

Ninj = mOX/(Cd*Ahole*sqrt(2*denOX*deltaP)); %number injectors

fprintf('With a hole diameter of %0.3f inches, we will need %0.0f holes.\n', dhole, Ninj)


