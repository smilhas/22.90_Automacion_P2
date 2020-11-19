function [goesThroughBlob,intersectOut] = g1goesThroughBlobs(segment, P)
%g1goesThroughBlob Devueleve true si pasa por el Blob o false en el caso
%contrario
    N = length(P);
    blobSegs = zeros(N,4);
    bbox = zeros(2,2);
    for i=1 : N
        bbox = P(i).bbox;
        blobSegs(i,:) = [bbox(1,1) bbox(2,1) bbox(1,2) bbox(2,2)];
    end
    seg = [segment(1,1) segment(2,1) segment(1,2) segment(2,2)];
    intersectOut = lineSegmentIntersect(seg, blobSegs);
    goesThroughBlob = nnz(intersectOut.intAdjacencyMatrix) > 0;
end

