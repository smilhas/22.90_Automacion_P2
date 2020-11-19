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
S=ones(1,1);

% Si no funciona hay que correr el make.m de en la carpeta de vision y
% despues el startup_rvc.m script (una carpeta más arriba)
filtrado = irank(imagen, 8, S); %este anda flama, ver forma de pasarlo a uint_8
idisp(filtrado, 'new');
% S2=kcircle(1);
% filtrado_02=iopen(iclose(imagen,S2),S2);    % Alternativa a irank
% figure();idisp(filtrado_02);
%% Identifico los Blobs
[P,N,L]=g1GetBlobs(filtrado);

%% Encuentro P máximo y dibujo caja roja
margin = 10;
[P,base]=g1removeblobsBase(P); %remuevo el fondo
[Pmax,heightMax,marginBbox] = g1RequiredBlob(P,margin);

% Dibujo Blob máximo
plot_box(marginBbox,'r');

%% Busco la línea
% segment = [2 2; 42 42];
% printSegment(segment);
% g1goesThroughBlobs(segment,P)

points = g1getPuntitos(1000,90/20,50);
XCent = [Pmax.uc Pmax.vc];
X = g1getInflectionPoint(points,P,XCent);
if X ~= -1
    segment01 = [1 1; X];
    segment02 = [X; XCent];
    printSegment(segment01);
    printSegment(segment02);
end
% figure
% plot(points(:,1), points(:,2), 'o')
