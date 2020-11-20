function [g1cuadrados] = g1filtrarcorners(blobsObj,numeroObjetos,cornersData,imgSegmentada)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
g1cuadrados=[];
data2Push=Rectangulo;
for i=1:numeroObjetos
    %separo la data en dos arreglos
    [tv,tu]=g1splitdata(cornersData(i,:));
    %si no hay por lo menos trespuntos ignoro el cuadrado
    if (length(tv)>2) %si hay tres por lo menos tras puntos uso la funcion g1getmaxdiferencie
    %a las dos coordendaspara encontrarel maximo delta u y v
    maxDeltaV=g1getmaxdiference(tv);
    maxDeltaU=g1getmaxdiference(tu);
    data2Push.deltaU=maxDeltaU;
    data2Push.deltaV=maxDeltaV;
    %busco el centroide en el arreglo de blobs evualoandolo respecot a la
    objeto=imgSegmentada((tv(2)),(tu(2)));
    for j=1:numeroObjetos
        centroMasa=blobsObj(j).p;
        if(imgSegmentada(int16(centroMasa(2)),int16(centroMasa(1)))==objeto)
            data2Push.vcentro=centroMasa(2);
            data2Push.ucentro=centroMasa(1);
            g1cuadrados=[g1cuadrados data2Push];
            break;
        end
    end
    %imgaen segmentada
    end
end


end

