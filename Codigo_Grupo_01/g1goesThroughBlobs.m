function [goesThroughBlob,intersectNum] = g1goesThroughBlobs(segment, P)
%g1goesThroughBlob Devueleve un flag "goesThroughBlob" que indica si el
%segmento "segment" atraviesa algún Blob dentro del arreglo de Blobs P.
%También devuelve un valor "intersectNum" que inica la cantidad de
%intersecciónes que tuvo, en el caso de que el flag sea true.

    %   segment: [x1 y1; x2 y2]
    %   P: Arreglo de Blobs RegionFeature[]

    margen=2;   % dejamos este margen debido a que no confiamos en las dimensiones
    %de los iblobs
    x1=2;%umin
    x2=2;%umax
    y1=2;%vmin
    y2=2;%vmax
    seg = [segment(1,1) segment(1,2) segment(2,1) segment(2,2)];
    N = length(P);
    blobSegs = zeros(4*N,4);
    for i=1 : N
        x1=P(i).umin-margen;
        x2=P(i).umax+margen;
        y1=P(i).vmin-margen;
        y2=P(i).vmax+margen;
        
        blobSegs(4*(i -1) + 1,:) = [x1 y1 x2 y1];
        blobSegs(4*(i -1) + 2,:) = [x1 y1 x1 y2];
        blobSegs(4*(i -1) + 3,:) = [x1 y2 x2 y2];
        blobSegs(4*(i -1) + 4,:) = [x2 y1 x2 y2];
    end
    intersectOut = lineSegmentIntersect(blobSegs,seg);
    intersectNum = nnz(intersectOut.intAdjacencyMatrix);
    goesThroughBlob = nnz(intersectOut.intAdjacencyMatrix) > 0;
end

