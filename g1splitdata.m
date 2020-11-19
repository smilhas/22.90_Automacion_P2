function [g1v,g1u] = g1splitdata(data2split)
%UNTITLED9 Summary of this function goes here
% Recivo arreglo 1x20 y lo divido en u y v ignoro los datos que son nan

g1v=[];
g1u=[];
for i=1:2:length(data2split)
    if(isnan(data2split(i)))
        break;
    else
        g1v=[g1v data2split(i)];
        g1u=[g1u data2split(i+1)];
    end
end


end

