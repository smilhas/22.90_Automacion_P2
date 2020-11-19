function [lines] = g1getOriginLines(A,theta)
%getOriginLines devuelve las líneas que salen del orígen y no cruzan ningún
%pixel
%   Recibe la matriz de Hough y devuelve las líneas

    i = ceil(length(A)/2);
    for j=1:length(A)
        if A(i,j) == 0
            lines(end+1) = theta(j);
        end
    end
end

