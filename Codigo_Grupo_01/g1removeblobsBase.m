function [rblobs,rbase] = g1removeblobsBase(g1blobs)
%UNTITLED Summary of this function goes here
%   saco el fondo respecto a los cuadradtios, el fondolo debuelvo en rbase
%el resto en rblobs
rblobs=[];
rbase=[];
for i=1:length(g1blobs)
    if(g1blobs(i).area<100000)
        rblobs=[rblobs g1blobs(i)];
    else
        rbase=[rbase g1blobs(i)];
    end
end
end

