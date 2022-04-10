clc;
clear all;
close all; 

%importando as imagens
%normal
path = "dataset/normal/";
f=dir(path+"*.png");
files={f.name};
for k=1:numel(files)
  normIm{k}=imread(path+files{k});
end

%tuberculose
path = "dataset/tuberculose/";
f=dir(path+"*.png");
files={f.name};
for k=1:numel(files)
  tubeIm{k}=imread(path+files{k});
end

%%
%info image
Pulmao_normal = normIm{1};
whos Pulmao_normal
Pulmao_tuberculoso = tubeIm{1};
whos Pulmao_tuberculoso;

%%
%Imagem em escala de cinza - dataset controle
for k=1:numel(normIm)
    normIm_m{k} = rgb2gray(normIm{k});
end

%%
%Imagem em escala de cinza - dataset tuberculose
for k=1:numel(tubeIm)
    tubeIm_m{k} = rgb2gray(tubeIm{k});
end

%%
%antes e depois de aplicar a escala de cinza - controle
lines = numel(normIm);
colums = 2;
figure('Units','normalized','Color','w','Menubar','none','Position',[0 0 1 1])
for k=1:numel(normIm)
    subplot(colums, lines, k);
    imshow(normIm{k});
    title("Raio-X antes");
    subplot(colums, lines, k+lines);
    imshow(normIm_m{k});
    title("Raio-X depois");
end

%%
%Antes e depois de aplicar a escala de cinza - tuberculose
lines = numel(tubeIm);
figure('Units','normalized','Color','w','Menubar','none','Position',[0 0 1 1])
for k=1:numel(tubeIm)
    subplot(colums, lines, k);
    imshow(tubeIm{k});
    title("Raio-X antes");
    subplot(colums, lines, k+lines);
    imshow(tubeIm_m{k});
    title("Raio-X depois");
end

%%
%Histograma para as imagens em escala de cinza - controle
colums = 2;
lines = 3; 
figure()
for k=1:lines
    subplot(colums, lines, k);
    imshow(normIm_m{k});
    %title("Raio-X antes");
    subplot(colums, lines, k+lines);
    imhist(normIm_m{k});
    %title("Raio-X depois");
end

%%
%Histograma para as imagens em escala de cinza - tuberculose
figure()
for k=1:lines
    subplot(colums, lines, k);
    imshow(tubeIm_m{k});
    %title("Raio-X antes");
    subplot(colums, lines, k+lines);
    imhist(tubeIm_m{k});
    %title("Raio-X depois");
end

%%
%Valor de min, max e sd - controle 
normAll = cell2mat(normIm_m);
tubeAll = cell2mat(tubeIm_m);

normMin = min(normAll,[],'all');
normMax = max(tubeAll,[],'all');

%Valor de min, max e sd - tuberculose 
tubeMin = min(normAll,[],'all');
tubeMax = max(tubeAll,[],'all');

%Valor medio
normMean = mean(normAll,'all');
tubeMean = mean(tubeAll,'all');

%Desvio Padrão
normDesv = std(double(normAll(:)));
tubeDesv = std(double(tubeAll(:)));