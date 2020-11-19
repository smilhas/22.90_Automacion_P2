function [g1maxdif] = g1getmaxdiference(data)
%UNTITLED6 Summary of this function goes here
%   Devuelve la maxima diferencia entre todos los elementos del arreglo
%   data

longitud=length(data);
g1maxdif=0;
for i=1:longitud
    for j=1:longitud
       currentDiff=abs(data(i)-data(j));
       if(currentDiff>g1maxdif)
           g1maxdif=currentDiff;
       end
    end
end

