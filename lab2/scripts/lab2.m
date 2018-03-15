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