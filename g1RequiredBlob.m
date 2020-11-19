function [Pmax,hmax,bbox] = g1RequiredBlob(P, margin)
%g1RequiredBlob función que me devuleve el Blob de mayor altura y al menos
%10 de ancho
%   Recive una Region Feature con todos los Blobs
%   devuelve el Blob de mayor altura y al menos 10 de ancho
    hmax = 0;
    for i=1:length(P)
        width = P(i).umax - P(i).umin;
        if width < 500
            if width >= 10
                height = P(i).vmax - P(i).vmin;
                if height > hmax
                    Pmax = P(i);
                    hmax = height;
                end
            end
        end
    end
    bbox = [Pmax.umin - margin, Pmax.umax + margin;            
            Pmax.vmin - margin, Pmax.vmax + margin];
end


