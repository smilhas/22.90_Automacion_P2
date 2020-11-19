function [points] = g1getPuntitos(side, angular_sep, radial_sep)
% g1getPuntitos Esta función genera el arreglo de puntos [x y] que pueden
% llegar a ser puntos de inflexión. Los puntos que genera son aquellos que
% están sobre las rectas que salen del origen. Además, el ángulo de cada
% recta respecto al eje 'y' se define por el param "angular_step" y la separación
% radial entre punto y punto de cada recta queda definido por "radial_sep".
 % El parámetro side es el ancho/largo de la imágen donde van a estar las
 % rectas.


    points = [];

    for theta = angular_sep:angular_sep:90-angular_sep
        for radio = 0:radial_sep:round(sqrt(2)*side)
            x = radio * cos(theta*pi/180);
            y = radio * sin(theta*pi/180);
            if(x < side && y < side)
                points(end+1,:)=[x y];
            end
        end
    end

end

