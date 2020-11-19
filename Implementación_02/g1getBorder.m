function g1imagenBordeada = g1getBorder(imagen)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
filtradoU = iconvolve(imagen, kdgauss(1) ); %lineas horzontales
filtradoV = iconvolve( imagen, kdgauss(1)' );%lineas verticales
g1imagenBordeada = sqrt( filtradoU.^2 + filtradoV.^2 );%agrupo todos los resultados en una sola imagen

end

