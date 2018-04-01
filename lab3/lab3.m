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

blueness = b;

[h,w,~] = size(rgb);

for i = 1 : h
    for j = 1 : w
		blueness(i,j) = b(i,j) - max(r(i,j), g(i,j));
    end
end

hist = figure(5);imhist(b),title('Blue Histogram');
saveas(hist,strcat(out,name,'-','hist_basic',ext));

hist = figure(6);imhist(blueness),title('Blueness Histogram');
saveas(hist,strcat(out,name,'-','hist_alt',ext));

thresholds = [32 64 96 128 160 192 224];

for i = 1 : 7
    threshold = thresholds(i);
    mask = zeros(h,w);
    for j = 1 : h
        for k = 1 : w
            if b(j,k) < threshold
                mask(j,k) = 255;
            end
            
        end
    end
    figure(i+6),imshow(mask),title('Basic Segmenation');
    imwrite(mask,strcat(out,name,'-','basic_',num2str(threshold),ext));
    mask = cat(3,mask,mask,mask);
    colored = rgb;
    colored(~mask) = 0;
    figure(i+13),imshow(colored),title('Superimposition');
    imwrite(colored,strcat(out,name,'-','basic_sup_',num2str(threshold),ext)); 
end

for i = 1 : 7
    mask = zeros(h,w);
    threshold = thresholds(i);
    for j = 1 : h
        for k = 1 : w
            if blueness(j,k) < threshold
                mask(j,k) = 255;
            end
            
        end
    end
    figure(i+20),imshow(mask),title('Alternative Segmenation');
    imwrite(mask,strcat(out,name,'-','alt_',num2str(threshold),ext));
    mask = cat(3,mask,mask,mask);
    colored = rgb;
    colored(~mask) = 0;    
    figure(i+27),imshow(colored),title('Superimposition');
    imwrite(colored,strcat(out,name,'-','alt_sup_',num2str(threshold),ext));    
end