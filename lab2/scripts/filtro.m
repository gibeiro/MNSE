function imagemfiltrada=filtro(imagem,tipo_filtro,dimensao)
% funcao recebe imagem a filtrar, tipo de filtro.
% Usa fspecial para criar o filtro.
% Como tipo de filtro experimente:
% 'motion' para dar efeito de movimento a imagem
% 'average' e/ou 'gaussian' para fazer uma filtragem passa-baixo
% 'prewitt' e/ou 'sobel' para real?ar contornos horizontais
% 'unsharp" para realcar contornos
% A dimensao do filtro por omissao ? de 3x3. Use valores de 3 a 10.
% Devolve a imagem filtrada. 

I=imread(imagem);
figure(1); imshow(I); title('imagem original');

switch tipo_filtro
    case 'prewitt'
        filtro=fspecial(tipo_filtro);
        IfiltradaHorizontal=imfilter(I,filtro,'replicate');
        figure(2); imshow(IfiltradaHorizontal); title('imagem filtrada prewitt horizontal');
        IfiltradaVertical=imfilter(I,filtro','replicate');
        figure(3); imshow(IfiltradaVertical); title('imagem filtrada prewitt vertical');
    case 'sobel'
        filtro=fspecial(tipo_filtro);
        IfiltradaHorizontal=imfilter(I,filtro,'replicate');
        figure(2); imshow(IfiltradaHorizontal); title('imagem filtrada prewitt horizontal');
        IfiltradaVertical=imfilter(I,filtro','replicate');
        figure(3); imshow(IfiltradaVertical); title('imagem filtrada prewitt vertical');
    otherwise
        filtro=fspecial(tipo_filtro,dimensao);
        Ifiltrada=imfilter(I,filtro,'replicate');
        figure(2); imshow(Ifiltrada); title('imagem filtrada');
        imagemfiltrada=Ifiltrada;
end


