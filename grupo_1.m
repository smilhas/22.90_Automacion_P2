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

filtrado = irank(ruido, 8, 1); %este anda flama
%idisp(filtrado);
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
%idisp(A);
%filtrado3 = irank(filtrado2, 12, 2);
%figure(3)
%idisp(filtrado2);

%% Detecto las esquinas de las figuras
% X=icorner(A,'nfeat',N*4);
[X,Ldil]=g1getcorner(A,L,N); 
% Ldil=idilate(L, kcircle(4));
 idisp(Ldil, 'new')
 X.plot

%[figures] = IdentificarFiguras(N, Ldil, X);

% figure();idisp(A);
% X.plot
