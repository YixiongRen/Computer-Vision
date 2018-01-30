close all
clear all

filename = 'medtest.png';
img = imread(filename); 

% [m,n] = size(img);
% for i = 1:m
%     for j = 1:n
%         if img(i,j)>250
%             img(i,j) = 250;
%         elseif img(i,j)<10
%             img(i,j) = 10;
%         end
%     end
% end


img_double = double(img)/256;
  

S_x = [-1,0,1;-2,0,2;-1,0,1];
S_y = [-1,-2,-1;0,0,0;1,2,1];

figure(1);
G_x = conv2(img_double,S_x,'same'); % scale is 'same' as img_double
imshow(abs(G_x)/max(max(G_x)));                   % negative ableitung wird mit abs() positiv sein

figure(2);
G_y = conv2(img_double,S_y,'same');
imshow(abs(G_y)/max(max(G_y)));
% figure(6);
% imhist(abs(G_y)/max(max(G_y)));

[m,n] = size(img);
G = zeros(m,n);
for i = 1:m
    for j = 1:n
        G(i,j) = sqrt(G_x(i,j)^2 + G_y(i,j)^2);
    end
end
G_max = max(max(G));
figure(3);
imshow(G/G_max);

% figure(7);
% imhist(G/G_max);


theta = zeros(m,n);
for i = 1:m
    for j = 1:n
        theta(i,j) = atan2(G_y(i,j),G_x(i,j));
    end
end

theta_double = double(theta);

figure(4);
imshow(abs(theta/pi));

[m,n] = size(img);
hue = zeros(m,n);
for i = 1:m
    for j = 1:n
        hue(i,j) = abs(theta(i,j)/pi);
    end
end

saturation = ones(size(G));


value = zeros(size(G));
for i = 1:m
    for j = 1:n
        value(i,j) = G(i,j)/G_max;
    end
end
% value=imadjust(value,[],[],0.3);
% value=histeq(value);

figure(5);
img_colored = hsv2rgb(cat(3,hue,saturation,value));
imwrite(img_colored,'medtestColored.png');
imshow(img_colored);