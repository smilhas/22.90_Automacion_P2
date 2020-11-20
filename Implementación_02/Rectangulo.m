classdef Rectangulo
    
%Asi se usa
% A = Rectangulo(2); crea un arreglo con 2 elementos que son de tipo
% Rectangulo
% A(1).ycentro = 1;
% A(2).ycentro = 2;

    properties
        ucentro;
        vcentro;
        deltaU;
        deltaV;
    end
    
    methods
function obj = Rectangulo(F)
         if nargin ~= 0
            obj(F) = obj;
           for j = 1:F
              obj(j).xcentro = 0;
              obj(j).ycentro = 0;
              obj(j).ancho = 0;
              obj(j).alto = 0;
           end
         end
      end
    end
end

