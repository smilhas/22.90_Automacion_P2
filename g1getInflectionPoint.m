function [X] = g1getInflectionPoint(points, P, XCent)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    for i=1:length(points)
        if ~g1goesThroughBlobs([2 2; points(i,:)], P)
            [int, intNum] = g1goesThroughBlobs([points(i,:); XCent], P);
            if intNum <= 2
                X = points(i,:);
                return;
            end
        end
    end
    X=-1;
end

