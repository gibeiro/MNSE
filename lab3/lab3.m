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