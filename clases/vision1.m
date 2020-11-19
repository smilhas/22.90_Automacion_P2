%% VISION 1 - HISTOGRAMAS, NORMALIZACION Y DETECCION DE MOVIMIENTO
clear all
close all
clc

%% CARGA DE IMAGENES Y VIDEOS
imgen=imread('ejvisionruido.jpg');               %Funcion propia de MATLAB, reemplazar imagen por una en su PC
im=iread('ejvisionruido.jpg');                   %Funcion TOOLBOX, reemplazar imagen por una en su PC
im_d=idouble(im);                                                   %Funcion TOOLBOX, reemplazar imagen por una en su PC
%vid=Movie('C:\Users\Rodo\Documents\Youcam\Capture_20180923.wmv');   %Funcion TOOLBOX, reemplazar video por uno en su PC

% about imgen
% about im
% about im_d
% about vid       %Nota: vid no es el video, es la ruta al video y la descripcion del mismo.
% vid
% 
% imgrey_d=imono(im_d);   %imagen en escala de grises, double
% figure(1)
% idisp(imgrey_d);
% 
% figure(2)
% im_norm=inormhist(imgrey_d);    %Aplica funcion monadica 'normalizacion'
% idisp(im_norm);
% 
% im_thres=im_norm>0.28;          %Aplia funcion monadica 'Umbral'
% figure(5)
% idisp(im_thres);

%vermovimiento(vid);             %Aplica funcion diadica para captar diferencias entre una serie de imagenes