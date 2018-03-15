# Relatório do Lab 2: Fundamentos de processamento de sinais visuais
```
Nome:   Gonçalo Ribeiro
Código: up201403977
Data:   16-03-2018
MNSE 2017/2018
```
## 1. Espaços de Cor

Foi-nos pedido que desenvolvessemos um script Matlab que:
1. Importe uma imagem com o formato bitmap (espaço de cores RGB) e apresente essa 
imagem no écran;
2. Separe cada componente RGB numa matriz diferente e apresente no écran cada uma 
delas;
3. Converta  essa  imagem  para  o  espaço  de  cores  HSV  e  apresente  essa  imagem  no 
écran;
4. Separe cada componente HSV numa matriz diferente e apresente no écran cada uma 
delas.

Este foi o script desenvolvido e utilizado para tais efeitos:

```matlab
function [] = lab2(in,out)

[~,name,ext] = fileparts(in);

% 1.1 i)
rgb = imread(in);
if size(rgb,3) ~= 3
rgb = cat(3,rgb,rgb,rgb)
end
figure(1),imshow(rgb),title('RGB');
imwrite(rgb,strcat(out,name,'-','rgb',ext));

% 1.1 ii)
r = rgb(:,:,1);
figure(2),imshow(r),title('Red');
imwrite(r,strcat(out,name,'-','r',ext));

g = rgb(:,:,2);
figure(3),imshow(g),title('Green');
imwrite(g,strcat(out,name,'-','g',ext));

b = rgb(:,:,3);
figure(4),imshow(b),title('Blue');
imwrite(b,strcat(out,name,'-','b',ext));

% 1.1 iii)
hsv = rgb2hsv(rgb);
figure(5),imshow(hsv),title('HSV');
imwrite(hsv,strcat(out,name,'-','hsv',ext));

% 1.1 iv)
h = hsv(:,:,1);
figure(6),imshow(h),title('Hue');
imwrite(h,strcat(out,name,'-','h',ext));

s = hsv(:,:,2);
figure(7),imshow(s),title('Saturation');
imwrite(s,strcat(out,name,'-','s',ext));

v = hsv(:,:,3);
figure(8),imshow(v),title('Value');
imwrite(v,strcat(out,name,'-','v',ext));
```

## 1.1. Conversão de RGB para HSV

A tabela seguinte apresenta as 5 imagens usadas nesta experiência divididas nas suas componentes vermelha, verde e azul.

|RGB|Red|Green|Blue|
|:-:|:-:|:-:|:-:|
|<img src='out/testRGB-rgb.bmp' style='height:108px'>|<img src='out/testRGB-r.bmp' style='height:108px'>|<img src='out/testRGB-g.bmp' style='height:108px'>|<img src='out/testRGB-b.bmp' style='height:108px'>|
|<img src='out/floresVermelhas-rgb.bmp' style='height:108px'>|<img src='out/floresVermelhas-r.bmp' style='height:108px'>|<img src='out/floresVermelhas-g.bmp' style='height:108px'>|<img src='out/floresVermelhas-b.bmp' style='height:108px'>|
|<img src='out/folhasVerdes-rgb.bmp' style='height:108px'>|<img src='out/folhasVerdes-r.bmp' style='height:108px'>|<img src='out/folhasVerdes-g.bmp' style='height:108px'>|<img src='out/folhasVerdes-b.bmp' style='height:108px'>|
|<img src='out/praia-rgb.bmp' style='height:108px'>|<img src='out/praia-r.bmp' style='height:108px'>|<img src='out/praia-g.bmp' style='height:108px'>|<img src='out/praia-b.bmp' style='height:108px'>|
|<img src='out/elephant-rgb.bmp' style='height:108px'>|<img src='out/elephant-r.bmp' style='height:108px'>|<img src='out/elephant-g.bmp' style='height:108px'>|<img src='out/elephant-b.bmp' style='height:108px'>|

A primeira imagem representa um gradiente arco-íris horizontal. As componentes desta imagem são colunas verticais localizadas em cima da zona correpondente à sua cor no arco-íris.

Como a segunda imagem é predominantemente vermelha, a componente vermelha é mais brilhante do que as restantes duas. O mesmo acontece com a imagem seguinte e a sua componente verde.

A próxima imagem é de uma praia. O componente azul é mais brilhante no céu e no reflexo do céu na água. A componente vermelha é brilhante nas escarpas no fundo da imagem. A componente verde está irmamente distribuida pela imagem.

A última imagem é a preto e branco. Por esse motivo, as componentes são todas iguais, "cancelando-se" umas às outras de forma a nenhuma cor ser realçada.

A próxima tabela apresenta a transformação das imagens originais para um espaço de cor HSV, divididas nas suas componentes hue, saturation e value:

Na última imagem é possível ver que os compontes hue e saturation são completamente nulos. Isto deve-se ao facto de imagem original

|HSV|Hue|Saturation|Value|
|:-:|:-:|:-:|:-:|
|<img src='out/testRGB-hsv.bmp' style='height:108px'>|<img src='out/testRGB-h.bmp' style='height:108px'>|<img src='out/testRGB-s.bmp' style='height:108px'>|<img src='out/testRGB-v.bmp' style='height:108px'>|
|<img src='out/floresVermelhas-hsv.bmp' style='height:108px'>|<img src='out/floresVermelhas-h.bmp' style='height:108px'>|<img src='out/floresVermelhas-s.bmp' style='height:108px'>|<img src='out/floresVermelhas-v.bmp' style='height:108px'>|
|<img src='out/folhasVerdes-hsv.bmp' style='height:108px'>|<img src='out/folhasVerdes-h.bmp' style='height:108px'>|<img src='out/folhasVerdes-s.bmp' style='height:108px'>|<img src='out/folhasVerdes-v.bmp' style='height:108px'>|
|<img src='out/praia-hsv.bmp' style='height:108px'>|<img src='out/praia-h.bmp' style='height:108px'>|<img src='out/praia-s.bmp' style='height:108px'>|<img src='out/praia-v.bmp' style='height:108px'>|
<img src='out/elephant-hsv.bmp' style='height:108px'>|<img src='out/elephant-h.bmp' style='height:108px'>|<img src='out/elephant-s.bmp' style='height:108px'>|<img src='out/elephant-v.bmp' style='height:108px'>|

## 1.2. Conversão de HSV para YCbCr

Foi adicionado este trecho de código ao script adicional de forma a se transformarem as imagem iniciais para o espaço de cor YCbCr, dividindo-as nas compontentes luminance, blue chrominance e red chrominance.

```matlab
% 1.2
ycbcr = rgb2ycbcr(rgb);
figure(9),imshow(ycbcr),title('YCbCr');
imwrite(ycbcr,strcat(out,name,'-','ycbcr',ext));

y = ycbcr(:,:,1);
figure(10),imshow(y),title('Luma');
imwrite(y,strcat(out,name,'-','y',ext));

cb = ycbcr(:,:,2);
figure(11),imshow(cb),title('Blue Chroma');
imwrite(cb,strcat(out,name,'-','cb',ext));

cr = ycbcr(:,:,3);
figure(12),imshow(cr),title('Red Chroma');
imwrite(cr,strcat(out,name,'-','cr',ext));
```

A seguinte tabela apresenta os resultados obtidos:

|YCbCr|Luma|Blue Chroma|Red Chroma|
|:-:|:-:|:-:|:-:|
|<img src='out/testRGB-ycbcr.bmp' style='height:108px'>|<img src='out/testRGB-y.bmp' style='height:108px'>|<img src='out/testRGB-cb.bmp' style='height:108px'>|<img src='out/testRGB-cr.bmp' style='height:108px'>|
|<img src='out/floresVermelhas-ycbcr.bmp' style='height:108px'>|<img src='out/floresVermelhas-y.bmp' style='height:108px'>|<img src='out/floresVermelhas-cb.bmp' style='height:108px'>|<img src='out/floresVermelhas-cr.bmp' style='height:108px'>|
|<img src='out/folhasVerdes-ycbcr.bmp' style='height:108px'>|<img src='out/folhasVerdes-y.bmp' style='height:108px'>|<img src='out/folhasVerdes-cb.bmp' style='height:108px'>|<img src='out/folhasVerdes-cr.bmp' style='height:108px'>|
|<img src='out/praia-ycbcr.bmp' style='height:108px'>|<img src='out/praia-y.bmp' style='height:108px'>|<img src='out/praia-cb.bmp' style='height:108px'>|<img src='out/praia-cr.bmp' style='height:108px'>|
<img src='out/elephant-ycbcr.bmp' style='height:108px'>|<img src='out/elephant-y.bmp' style='height:108px'>|<img src='out/elephant-cb.bmp' style='height:108px'>|<img src='out/elephant-cr.bmp' style='height:108px'>|

## 1.3. Comparanção com `rgb2yuv.m`

## 2. Variação  das  dimensões  espaciais  de  imagem  usando  ou  não  filtros  com imagem de teste “imzoneplate”

<!--
x2 nearest = não se nota diferença entre imresize e repetição
x2 bilinear = por repetição é melhor, imresize torna-se em cinzento mais prox do centro
x2 bicubic = praticamente igual, centro dos circulos de aliasing é diferente

x.5 nearest = os circulos de aliasing têm so centros trocado (quando um é preto, o da outra imagem é branco e vice versa)
x.5 bilinear = imresize muito pior, torna-se em cinzento mais próximo do centro
x.5 bicubic = same as before
--> 

Para esta experiência, foi corrido o script 

## 3. Experiências de filtragem

|Filter \ Magnitude|4|7|10|
|:-:|:-:|:-:|:-:|
|Movement|<img src='out/movement-4.jpg' style='height:108px'>|<img src='out/movement-7.jpg' style='height:108px'>|<img src='out/movement-10.jpg' style='height:108px'>|
|Average|<img src='out/average-4.jpg' style='height:108px'>|<img src='out/average-7.jpg' style='height:108px'>|<img src='out/average-10.jpg' style='height:108px'>|
|Prewitt Horizontal|<img src='out/prewitt-horizontal-4.jpg' style='height:108px'>|<img src='out/prewitt-horizontal-7.jpg' style='height:108px'>|<img src='out/prewitt-horizontal-10.jpg' style='height:108px'>|
|Prewitt Vertical|<img src='out/prewitt-vertical-4.jpg' style='height:108px'>|<img src='out/prewitt-vertical-7.jpg' style='height:108px'>|<img src='out/prewitt-vertical-10.jpg' style='height:108px'>|

O filtro unsharp não foi utilizado porque o script dava erro.