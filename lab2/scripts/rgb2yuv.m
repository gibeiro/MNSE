function rgb2yuv(imagemEntrada);

E=imread(imagemEntrada);
figure(1); 
imshow(E); title('imagem original');

I=im2double(E);

R=I(:,:,1); figure(2),imshow (R);

G=I(:,:,2); figure(3),imshow(G);

B=I(:,:,3); figure(4),imshow(B);

Y = 0.299 * R + 0.587 * G + 0.114 * B;

figure(5),imshow(uint8(Y));

U = -0.14713 * R - 0.28886 * G + 0.436 * B;

figure(6),imshow(uint8(U)+128);

V = 0.615 * R - 0.51499 * G - 0.10001 * B;

figure(7),imshow(uint8(V)+128);

YUV = cat(3,Y,U,V);

figure(8),imshow(uint8(YUV));

R = Y + 1.139834576 * V;

G = Y -.3946460533 * U -.58060 * V;

B = Y + 2.032111938 * U;

RGB = cat(3,R,G,B);

figure(9),imshow(RGB), title('nova imagem RGB');;