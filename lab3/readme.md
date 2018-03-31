# Relatório do Lab 3: Processamento de Imagem em Matlab

```text
Nome:   Gonçalo Ribeiro
Código: up201403977
Data:   01-04-2018
MNSE 2017/2018
```

## 1. Extração de um Fundo Azul

## 1.1. Segmentação Básica

Foi pedido que se desenvolve-se um script Matlab que:
* Importe imagens com fundo azul e as apresente no ecrã;
* Separa cada um dos componentes RGB dessa imagem e os apresente no ecrã;
* Use a matriz da componente azul da imagem para distinguir objectos do fundo azul, apresentando um histograma dessa componente que permita o utilizador escolher um valor limite (de 0 a 255) a partir do qual é gerada uma máscara a preto e branco: a preto os pixeis com valores de componente azul superiores ao limite, a branco os que têm valores inferiores.

O script desenvolvido foi o seguinte:

```matlab
function [] = lab3(in,out)

[~,name,ext] = fileparts(in);
rgb = imread(in);

if size(rgb,3) ~= 3
    rgb = cat(3,rgb,rgb,rgb);
end

figure(1),imshow(rgb),title('RGB');
imwrite(rgb,strcat(out,name,'-','rgb',ext));

r = rgb(:,:,1);
figure(2),imshow(r),title('Red');
imwrite(r,strcat(out,name,'-','r',ext));

g = rgb(:,:,2);
figure(3),imshow(g),title('Green');
imwrite(g,strcat(out,name,'-','g',ext));

b = rgb(:,:,3);
figure(4),imshow(b),title('Blue');
imwrite(b,strcat(out,name,'-','b',ext));

hist = figure(5);imhist(b),title('Blue Histogram');
saveas(hist,strcat(out,name,'-','hist',ext));

thresholds = [0 64 128 192 256];

[h,w,~] = size(rgb);

for i = 1 : 5
    mask = zeros(h,w);
    threshold = thresholds(i);
    for j = 1 : h
        for k = 1 : w
            if b(j,k) < threshold
                mask(j,k) = 255;
            end
        end
    end
    figure(i+5),imshow(mask),title('Blue Threshold Mask');
    imwrite(mask,strcat(out,name,'-','mask_',num2str(threshold),ext));
end
```

Nas seguintes tabela encontram-se os resultados obtidos:

|RGB|Red|Green|Blue|
|:-:|:-:|:-:|:-:|
|![](out/birdBB-rgb.jpg)|![](out/birdBB-r.jpg)|![](out/birdBB-g.jpg)|![](out/birdBB-b.jpg)|
|![](out/christmasBB-rgb.jpg)|![](out/christmasBB-r.jpg)|![](out/christmasBB-g.jpg)|![](out/christmasBB-b.jpg)|
|![](out/jump-rgb.jpg)|![](out/jump-r.jpg)|![](out/jump-g.jpg)|![](out/jump-b.jpg)|

É possível observar que não só as zonas as azuis mas também zonas brancas (dorso do pássaro, reflexos nos efeitos natalicios, neve) têm uma componente azul mais intensa. Isto pode revelar-se como um problema na remoção do fundo azul por segmentação básica porque estas zonas brancas podem acabar por ser removidas erradamente.               

|Histogram|64|128|192|
|:-:|:-:|:-:|:-:|
|![](out/birdBB-hist.jpg)|![](out/birdBB-mask_64.jpg)|![](out/birdBB-mask_128.jpg)|![](out/birdBB-mask_192.jpg)|
|![](out/christmasBB-hist.jpg)|![](out/christmasBB-mask_64.jpg)|![](out/christmasBB-mask_128.jpg)|![](out/christmasBB-mask_192.jpg)|
|![](out/jump-hist.jpg)|![](out/jump-mask_64.jpg)|![](out/jump-mask_128.jpg)|![](out/jump-mask_192.jpg)|

No primeiro histograma verifica-se que maior parte dos pixeis da imagem (céu) têm uma componente azul entre 195 e 220. Isto sugere um limite próximo de 195 como o mais indicado para se remover o fundo. Verifica-se que a máscara com o limite 192 é a que retem melhor os contornos do pássaro enquanto remove o fundo.

No segundo histograma verifica-se que a componente azul quase que segue uma distribuição normal entre 70 e 200. Um limite próximo de 70 sería o mais indicado para se remover o gradiente azul de fundo. Verifica-se que a máscara com limite 64 foi a que melhor removeu o fundo, preservando o formato das esferas.

No terceiro histograma




## 1.2. Segmentação Alternativa

## 2. Adição de Objetos a uma Imagem