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

%Salvando info sample 'normal'
Pulmao_normal = path + files{1};
img_inf_normal = imageinfo(Pulmao_normal)



%tuberculose
path = "dataset/tuberculose/";
f=dir(path+"*.png");
files={f.name};
for k=1:numel(files)
  tubeIm{k}=imread(path+files{k});
end

%Salvando info sample 'tuberculose'
Pulmao_tuberculoso = path + files{1};
img_inf_tuberculoso = imageinfo(Pulmao_tuberculoso)

%%
%Imagem em escala de cinza - dataset controle
for k=1:numel(normIm)
    normIm_m{k} = rgb2gray(normIm{k});
end

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
%All values joined array 
normAll = cell2mat(normIm_m);
tubeAll = cell2mat(tubeIm_m);

%Valor de min, max - controle 
normMin = min(normAll,[],'all');
normMax = max(tubeAll,[],'all');

%Valor de min, max - tuberculose 
tubeMin = min(normAll,[],'all');
tubeMax = max(tubeAll,[],'all');

%Valor medio
normMean = mean(normAll,'all');
tubeMean = mean(tubeAll,'all');

%Desvio Padrão
normDesv = std(double(normAll(:)));
tubeDesv = std(double(tubeAll(:)));

%Box plot
figure()
subplot(1,2,1);
normBox = boxplot([normMin,  normMax, normMean, normDesv]);
title('Normal');

subplot(1,2,2);
tubeBox = boxplot([tubeMin,  tubeMax, tubeMean, tubeDesv]);
title('Tuberculoso');

%%
%Aplicação de contraste - Tuberculose
%função 'localcontrast' - aumenta o contraste local da imagem em tons de cinza ou RGB
%Aumenta ou suaviza os detalhes, deixando as bordas fortes inalteradas
%lim_borda: define a amplitude de intensidade mínima de bordas fortes para deixar intactas
%quant: quantidade de realce ou suavização desejada.
colums = 2;
lines = 2;
lim_borda = 0.1;
quant = 1;
A{1} = localcontrast(tubeIm_m{4}, lim_borda, quant);
A{2} = tubeIm_m{4};
figure("Name", "Modified First")
for k=1:2
    subplot(colums,lines,k);
    imshow(A{k});
    subplot(colums,lines,k+lines);
    imhist(A{k});
end

%função histeq - melhora o contraste usando a equalização de histograma
A{1} = histeq(tubeIm_m{4});
A{2} = tubeIm_m{4};
figure("Name", "Modified Second")
for k=1:2
    subplot(colums,lines,k);
    imshow(A{k});
    subplot(colums,lines,k+lines);
    imhist(A{k});
end


%%
%aplicações de operações aritméticas 
%soma
soma_img_t1_m = tubeIm_m{1} + tubeIm_m{1};
soma = tubeIm_m{1} + normIm_m{1};

%subtração
%Pode ser utilizada para calcular o gradiente(detecção de bordas)
sub_img_t1_m  = imsubtract(tubeIm_m{1},tubeIm_m{1});
sub = tubeIm_m{1} - normIm_m{1};

%multiplicação
mult_img_t1_m  = 2*(tubeIm_m{1});
mult_img_n1_m  = 2*(normIm_m{1});

%divisão
img = 1+(tubeIm_m{1});
div_img_t1_m  = (img)/2;
img2 = 1+(normIm_m{1});
div_img_n1_m  = (img2)/2;

%combinação linear
comb_img_t1_m = 0.3*(tubeIm_m{1}) + 0.7*(tubeIm_m{1});
comb = 0.3*(normIm_m{1}) + 0.7*(normIm_m{1});

%plotagem
figure("Name","Operações Aritméticas",'Units','normalized','Color','w','Menubar','none','Position',[0 0 1 1]);
all_op_TandN = {soma_img_t1_m, sub_img_t1_m, mult_img_t1_m, div_img_t1_m, comb_img_t1_m, soma, sub, mult_img_n1_m, div_img_n1_m, comb};
operation_names = ["SOMA","SUBTRAÇÃO","MULTIPLICAÇÃO","DIVISÃO","COMBINAÇÃO LINEAR", "TUBERCULOSO", "NORMAL"];
counter2=0;

for counter1=1:10
        subplot(2,5,counter1);
        imshow(all_op_TandN{counter1});
        if counter1>=6
            counter2 = counter1 - 5;
            check_disease = 7;
        else
            counter2 = counter1;
            check_disease = 6;
        end
        title(operation_names(counter2) + " " + operation_names(check_disease));
          
end

% title("SOMA");
% subplot(2,5,2);
% imshow(sub_img_t1_m);
% title("SUBTRAÇÃO");
% subplot(2,5,3);
% imshow(mult_img_t1_m);
% title("MULTIPLICAÇÃO");
% subplot(2,5,4);
% imshow(div_img_t1_m);
% title("DIVISÃO");
% subplot(2,5,5);
% imshow(comb_img_t1_m);
% title("COMBINAÇÃO LINEAR");
% 
% subplot(2,5,6);
% imshow(soma_img_t1_m);
% title("SOMA");
% subplot(2,5,7);
% imshow(sub_img_t1_m);
% title("SUBTRAÇÃO");
% subplot(2,5,8);
% imshow(mult_img_t1_m);
% title("MULTIPLICAÇÃO");
% subplot(2,5,9);
% imshow(div_img_t1_m);
% title("DIVISÃO");
% subplot(2,5,10);
% imshow(comb_img_t1_m);
% title("COMBINAÇÃO LINEAR");
