function [X] = g1getInflectionPoint(points, P, XCent)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    for i=1:length(points)
        if ~g1goesThroughBlobs([1 1; points(i,:)], P)%despues de volar bolb base
            %poner [1 1] xq sino lo intersecta siempre
            [int, intNum] = g1goesThroughBlobs([points(i,:); XCent], P);
            if intNum <= 2%en el pero caso curca por la esquinita y ahi devuelve dos crces
                X = points(i,:);
                return;
            end
        end
    end
    X=-1;
end

