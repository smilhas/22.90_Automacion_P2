function [g1cornerObject] = g1agrupCorner(corners,cantidadObjetos,imagenSegmentada)
%UNTITLED5 Summary of this function goes here
%   La funcion agrupa los corner de los objetos que pertenecen a las misma
%   clase y los devuelve en un arreglo
verticesPorObjeto=10;
g1cornerObject = nan(cantidadObjetos,2*verticesPorObjeto); %a pesar de que los cuadrados tienen cuatro vertices, 
%hay en algunos cuadrados que detecta vertices adentro de el, por ende uso
%10

for i=1:length(corners)
    objeto=imagenSegmentada(corners(i).v_,corners(i).u_);%como los colores de cada 
    %objeto en la segemntacion es ditinto para cada objeto, utilizo el
    %color como identificador. Mas adelante se utilizara el color para
    %desreferenciar el arreglo g1cornerObjet
    for t=1:2:(2*verticesPorObjeto)
        if(isnan(g1cornerObject(objeto, t)))
            g1cornerObject(objeto,t) = corners(i).v;
            g1cornerObject(objeto,t+1) = corners(i).u;
            break;
        end
    end
end
end


