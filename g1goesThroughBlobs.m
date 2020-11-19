function [goesThroughBlob,intersectNum] = g1goesThroughBlobs(segment, P)
%g1goesThroughBlob Devueleve un flag "goesThroughBlob" que indica si el
%segmento "segment" atraviesa algún Blob dentro del arreglo de Blobs P.
%También devuelve un valor "intersectNum" que inica la cantidad de
%intersecciónes que tuvo, en el caso de que el flag sea true.

    %   segment: [x1 y1; x2 y2]
    %   P: Arreglo de Blobs RegionFeature[]
    
    
    seg = [segment(1,1) segment(1,2) segment(2,1) segment(2,2)];
    N = length(P);
    blobSegs = zeros(4*N,4);
    for i=1 : N
        blobSegs(4*(i -1) + 1,:) = [P(i).umin P(i).vmin P(i).umax P(i).vmin];
        blobSegs(4*(i -1) + 2,:) = [P(i).umin P(i).vmin P(i).umin P(i).vmax];
        blobSegs(4*(i -1) + 3,:) = [P(i).umin P(i).vmax P(i).umax P(i).vmax];
        blobSegs(4*(i -1) + 4,:) = [P(i).umax P(i).vmin P(i).umax P(i).vmax];
    end
    intersectOut = lineSegmentIntersect(blobSegs,seg);
    intersectNum = nnz(intersectOut.intAdjacencyMatrix);
    goesThroughBlob = nnz(intersectOut.intAdjacencyMatrix) > 0;
end

