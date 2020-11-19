function [goesThroughBlob,intersectOut] = g1goesThroughBlobs(segment, P)
%g1goesThroughBlob Devueleve true si pasa por el Blob o false en el caso
%contrario
    N = length(P);
    blobSegs = zeros(4*N,4);
    for i=1 : N
        blobSegs(4*(i -1) + 1,:) = [P(i).umin P(i).vmin P(i).umax P(i).vmin];
        blobSegs(4*(i -1) + 2,:) = [P(i).umin P(i).vmin P(i).umin P(i).vmax];
        blobSegs(4*(i -1) + 3,:) = [P(i).umin P(i).vmax P(i).umax P(i).vmax];
        blobSegs(4*(i -1) + 4,:) = [P(i).umax P(i).vmin P(i).umax P(i).vmax];
    end
    
    seg = [segment(1,1) segment(2,1) segment(1,2) segment(2,2)];
    intersectOut = lineSegmentIntersect(blobSegs,seg);
    goesThroughBlob = nnz(intersectOut.intAdjacencyMatrix) > 0;
end

