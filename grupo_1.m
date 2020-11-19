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
%S=kcircle(1);
imagen = imono(imagen);
S=ones(1,1);

filtrado = irank(imagen, 8, S); %este anda flama, ver forma de pasarlo a uint_8
idisp(filtrado, 'new');

% filtrado_02=iopen(iclose(imagen,S),S);    % Alternativa a irank
%% 
A=filtrado;%imagenLimpia<0.3;%para elegir el threshold hago un idisp y una linea y veo que que fa abajp
% [P,L]=iblobs(A);
% tam=size(P);
% N=tam(2);%-1;%Numero de blobs sin tener en cuenta el fondo
[P,N,L]=g1GetBlobs(filtrado);

%% Busco Bordes
%Iu = iconvolve(A, kdgauss(1) ); %lineas horzontales
%Iv = iconvolve( A, kdgauss(1)' );%lineas verticales
A = g1getBorder(A);

%% Detecto las esquinas de las figuras
% X=icorner(A,'nfeat',N*4);
[X,Ldil]=g1getcorner(A,L,N); 
% Ldil=idilate(L, kcircle(4));
 idisp(Ldil, 'new')
 X.plot

%[figures] = IdentificarFiguras(N, Ldil, X);

%figure();idisp(A);
% X.plot
%% Agrupo los puntos en objetos
objetos=g1agrupCorner(X,N,Ldil);

%% Conversion de puntos a ancho alto y centroide
cuadraditos=g1filtrarcorners(P,N,objetos,Ldil);

%% Encuentro P máximo y dibujo caja roja
margin = 10;
[Pmax,heightMax,bbox] = g1RequiredBlob(P,margin);
%% Dibujo Blob máximo
plot_box(bbox,'r');
%plot_box(Pmax.bbox,'r','LineWidth',1.5);
% bbox
% Pmax.bbox

%% Busco la línea
% figure
% imlin=Hough(filtrado);
% idisp(filtrado)
% imlin.plot %% Te grafica las líneas sobre la imagen
% 
% figure
% imlin.lines %% Te plotea las curvas ponderadas con color en 2D
% 
% figure
% mesh(imlin.A)   %% Gáfico en 3D
