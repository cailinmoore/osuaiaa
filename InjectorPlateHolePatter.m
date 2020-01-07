%Cailin Moore 
%Script to calculator number of holes per row in injector plate 

clear
clc

%% Finding number of rows

n = 353; %needed number of holes 
d = 1/16; %diameter of hole in inches 
dPlate = 1.81*2; %diameter of plate available for holes 

spacing = 0.15 - d; %spacing between edges of holes 

nRows = floor((dPlate/2)/(d+spacing))+1; %devide radius of injector plate 
                                         %by unit length of hole plus spacing

%% Finding holes per row 

pattern = zeros(nRows,1); 

for k = 1:nRows
    cir(k) = ((spacing+d)*k)*2*pi;
end 

spacingbetween = sum(cir)/n; %find even spacing between all holes

for k = 1:nRows
    pattern(k) = floor(cir(k)/(spacingbetween));
end 

numberholes = sum(pattern)
    
