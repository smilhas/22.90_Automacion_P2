function [points] = g1getPuntitos(side, angular_sep, radial_sep)
%UNTITLED3 Summary of this function goes here
%   side: ancho en pixeles
%angular_step: angulo en grados
%radial_step: separaciaon radial entre puntito y puntito en pixeles


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

