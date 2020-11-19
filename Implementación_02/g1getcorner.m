function [g1cordenadascorner,g1segmentacion] = g1getcorner(imagenBordes,segmentada,cantidadObejetos)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
g1cordenadascorner=icorner(imagenBordes,'nfeat',cantidadObejetos*4);%que me muestr 4*cantidad de cuadrados puntos
g1segmentacion=idilate(segmentada, kcircle(4));%difumino la segmentacion para aseguramene que los puntos caigan bien adentro del cuadrado
end

