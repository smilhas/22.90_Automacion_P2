function [g1cornerObject] = g1agrupCorner(corners,cantidadObjetos,imagenSegmentada)
%UNTITLED5 Summary of this function goes here
%   La funcion agrupa los corner de los objetos que pertenecen a las misma
%   clase y los devuelve en un arreglo
verticesPorObjeto=10;
g1cornerObject=nan(cantidadObjetos,2*verticesPorObjeto); %a pesar de que los cuadrados tienen cuatro vertices, 
%hay en algunos cuadrados que detecta vertices adentro de el, por ende uso
%10
for i=1:2:verticesPorObjeto
    
    
end
    

end

