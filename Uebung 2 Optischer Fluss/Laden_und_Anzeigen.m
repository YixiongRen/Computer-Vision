close all
clear all

filename = 'medtest.png';
img = imread(filename); 

figure(1);
imshow(img);                % showed in unit8 format(original)
% figure(1);
% imhist(img);

% 
% figure(1);
% J=histeq(img);
% imshow(J);


% a = 3;
% b = 20;
% img_adjust = zeros(size(img));
% [m,n] = size(img);
% for i = 1:m
%     for j = 1:n
%         img_adjust(i,j) = min(max((a*img(i,j)+b+0.5),0),2^b-1);
%     end
% end
% 

% [m,n] = size(img);
% for i = 1:m
%     for j = 1:n
%         if img(i,j)>240
%             img(i,j) = 240;
%         elseif img(i,j)<20
%             img(i,j) = 20;
%         end
%     end
% end
% 
% figure(1);
% J=imadjust(img,[],[],0.5);
% imshow(J);




disp(min(min(img)));
disp(max(max(img)));

img_double = double(img)/256;
figure(2);
imshow(img_double);            % unit8 von 0-255 double von 0-1 deswegen...
% oder:
% img_double = double(img);
% figure(2);
% imshow(img_double,[]); 