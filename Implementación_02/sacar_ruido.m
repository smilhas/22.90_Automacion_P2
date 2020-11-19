function [imagen_filtrada] = sacar_ruido(imagen_con_ruido)

imagen_filtrada = irank(imagen_con_ruido, 8, 1); 

end

