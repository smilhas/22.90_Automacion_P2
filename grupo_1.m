%% NO TOCAR
clear all
close all
clc
imagen=zeros(1000);

% generador de formas - rectangulos
for i=1:10
    for j=1:10
        generar=rand(); %generar <0.4 crea forma en cuadrante
        dondex=floor(rand()*100);
        dondey=floor(rand()*100);
        
        if generar<0.4
            imagen(i*100-dondex,j*100-dondey)=1;
            size=rand()*50;
            actual=0;
            flag=0;
            for p=1:98
                
                if flag==1
                    actual=actual+1;
                end
                
                if actual>size
                    break
                end
                
                for q=1:98
                    
                    if imagen(i*100-p,j*100-q)==1
                        flag=1;
                        imagen(i*100-p-1,j*100-q)=1;
                        imagen(i*100-p,j*100-q-1)=1;
                        imagen(i*100-p-1,j*100-q-1)=1;
                    end
                    
                end
            end
        end

    end
end



% agregar ruido

for i=1:1000
    for j=1:1000
        k=rand();
        if k<0.02
            imagen(i,j)=1; %ruido blanco

        end
    end
end
%% NO TOCAR    
idisp(imagen)
        
%% PUEDEN COLOCAR SU CODIGO A PARTIR DE ESTE TITULO
ruido=imono(imagen);
S=kcircle(1);
filtrado2=iopen(iclose(ruido,S),S);% es la que mejor va, todavia se ven poquito start y finish
figure(2)
idisp(filtrado2);
filtrado3 = irank(filtrado2, 12, 2);
figure(3)
idisp(filtrado2);