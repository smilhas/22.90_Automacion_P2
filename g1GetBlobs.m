function [g1blobs,g1amauntBlobs,g1segmentado] = g1GetBlobs(imagen)
%UNTITLED Summary of this function goes here
%   Recivio una imagen y devuelve los objetos que encuentra, ademas la
%   cantidad de ellos y la imagen segmentada. obs: no modifica imagen
[g1blobs,g1segmentado]=iblobs(imagen);
tam=size(g1blobs);
g1amauntBlobs=tam(2);
end

