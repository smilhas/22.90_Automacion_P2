%% VISION 2 - OPERACIONES ESPACIALES
clear all
close all
clc

%% CARGA DE IMAGEN
im=iread('C:\Users\Rodo\Desktop\34-800x513.jpg'); 
im=idouble(im);
im=imono(im);
kgaus=kgauss(1);
% im=iconv(im,kgaus);

idisp(im)
stop=input('continuar?');
close all
%% DETECCION DE BORDES
K=[-1/2 0 1/2];
imbordeh=iconv(im,K);
imbordev=iconv(im,K');
idisp(imbordeh,'invsigned')

stop=input('continuar?');
close all

imbordenorm=((imbordeh).^2+(imbordev).^2).^0.5;
idisp(imbordenorm)

stop=input('continuar?');
close all

imlaplace=iconv(im,klaplace());
thlaplace=(imlaplace>0.2)|(imlaplace<-0.2);         %sin filtro
% thlaplace=(imlaplace>0.07)|(imlaplace<-0.07);     %con filtro
idisp(imlaplace)

stop=input('continuar?');
close all

idisp(thlaplace)