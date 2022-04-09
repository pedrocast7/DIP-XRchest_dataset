clc;
clear all;
close all; 

%importando as imagens
%normal
img_n1 = imread('dataset\Normal\Normal-9.png');
img_n2 = imread('dataset\Normal\Normal-45.png');
img_n3 = imread('dataset\Normal\Normal-225.png');
img_n4 = imread('dataset\Normal\Normal-252.png');
img_n5 = imread('dataset\Normal\Normal-306.png');

%tuberculose
img_t1 = imread('dataset\Tuberculose\Tuberculosis-67.png');
img_t2 = imread('dataset\Tuberculose\Tuberculosis-190.png');
img_t3 = imread('dataset\Tuberculose\Tuberculosis-192.png');
img_t4 = imread('dataset\Tuberculose\Tuberculosis-308.png');
img_t5 = imread('dataset\Tuberculose\Tuberculosis-310.png');

%info image
whos img_n1

%Imagem em escala de cinza - dataset controle
img_n1_m = rgb2gray(img_n1);
img_n2_m = rgb2gray(img_n2);
img_n3_m = rgb2gray(img_n3);
img_n4_m = rgb2gray(img_n4);
img_n5_m = rgb2gray(img_n5);

%Imagem em escala de cinza - dataset tuberculose
img_t1_m = rgb2gray(img_t1);
img_t2_m = rgb2gray(img_t2);
img_t3_m = rgb2gray(img_t3);
img_t4_m = rgb2gray(img_t4);
img_t5_m = rgb2gray(img_t5);

%antes e depois de aplicar a escala de cinza - controle
figure('Units','normalized','Color','w','Menubar','none','Position',[0 0 1 1])
subplot(2,5,1)
imshow(img_n1)
title("Raio-X antes")
subplot(2,5,6)
imshow(img_n1_m)
title("Raio-X depois")

subplot(2,5,2)
imshow(img_n2)
title("Raio-X antes")
subplot(2,5,7)
imshow(img_n2_m)
title("Raio-X depois")

subplot(2,5,3)
imshow(img_n3)
title("Raio-X antes")
subplot(2,5,8)
imshow(img_n3_m)
title("Raio-X depois")

subplot(2,5,4)
imshow(img_n4)
title("Raio-X antes")
subplot(2,5,9)
imshow(img_n4_m)

subplot(2,5,5)
imshow(img_n5)
title("Raio-X antes")
subplot(2,5,10)
imshow(img_n5_m)
title("Raio-X depois")

%Antes e depois de aplicar a escala de cinza - tuberculose
figure('Units','normalized','Color','w','Menubar','none','Position',[0 0 1 1])
subplot(2,5,1)
imshow(img_t1)
title("Raio-X antes")
subplot(2,5,6)
imshow(img_t1_m)
title("Raio-X depois")

subplot(2,5,2)
imshow(img_t2)
title("Raio-X antes")
subplot(2,5,7)
imshow(img_t2_m)
title("Raio-X depois")

subplot(2,5,3)
imshow(img_t3)
title("Raio-X antes")
subplot(2,5,8)
imshow(img_t3_m)
title("Raio-X depois")

subplot(2,5,4)
imshow(img_t4)
title("Raio-X antes")
subplot(2,5,9)
imshow(img_t4_m)
title("Raio-X depois")

subplot(2,5,5)
imshow(img_t5)
title("Raio-X antes")
subplot(2,5,10)
imshow(img_t5_m)
title("Raio-X depois")

%Histograma para as imagens em escala de cinza - controle
figure()
subplot(2,3,1)
imshow(img_n1_m);
subplot(2,3,4)
imhist(img_n1_m);

subplot(2,3,2)
imshow(img_n2_m);
subplot(2,3,5)
imhist(img_n2_m);

subplot(2,3,3)
imshow(img_n3_m);
subplot(2,3,6)
imhist(img_n3_m);

%Histograma para as imagens em escala de cinza - tuberculose
figure()
subplot(2,3,1)
imshow(img_t1_m);
subplot(2,3,4)
imhist(img_t1_m);

subplot(2,3,2)
imshow(img_t2_m);
subplot(2,3,5)
imhist(img_t2_m);

subplot(2,3,3)
imshow(img_t3_m);
subplot(2,3,6)
imhist(img_t3_m)

%Valor de min, max e sd - controle 
n_min = min([min(min(img_n1_m)) min(min(img_n2_m)) min(min(img_n3_m))]);
n_max = max([max(max(img_n1_m)) max(max(img_n2_m)) max(max(img_n3_m))]);

%Valor de min, max e sd - tuberculose 
t_min = min([min(min(img_t1_m)) min(min(img_t2_m)) min(min(img_t3_m))]);
t_max = max([max(max(img_t1_m)) max(max(img_t2_m)) max(max(img_t3_m))]);







