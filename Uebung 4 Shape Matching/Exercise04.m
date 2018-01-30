%% Exercise 4:
tic
close all;

%% Aufgabe 4.2.1 a):
x = [1,1;1,-1;-1,1;-1,-1];
x0 = [1,1;1,-1;-1,1;-1,-1];
y0 = [3;1;1;2];
lambda = 0;
[y, alpha, beta] = ComputeTPS(x, x0, y0, lambda);
disp('alpha=');
disp(alpha);
disp('beta=');
disp(beta);

x = [0,0];
[y, alpha, beta] = ComputeTPS(x, x0, y0, lambda);
fprintf('y(x=0)=%8.5f\n',y);
% 
% lambda = 0.1;
% y = [];
% [X Y] = meshgrid(-1.5:.1:1.5,-1.5:.1:1.5);
% x = [X(:),Y(:)];
% for i =1:31
%     for j =1:31
%         x_ = [x((i-1)*31+j,1),x((i-1)*31+j,2)];
%         [y_, alpha, beta] = ComputeTPS(x_, x0, y0, lambda);
%         y = [y y_];
%     end
% end
% Z = reshape(y,size(X));
% figure('NumberTitle', 'off', 'Name', 'lambda = 0.1');
% surf(X,Y,Z);
% 
% lambda = 1;
% y = [];
% [X Y] = meshgrid(-1.5:.1:1.5,-1.5:.1:1.5);
% x = [X(:),Y(:)];
% for i =1:31
%     for j =1:31
%         x_ = [x((i-1)*31+j,1),x((i-1)*31+j,2)];
%         [y_, alpha, beta] = ComputeTPS(x_, x0, y0, lambda);
%         y = [y y_];
%     end
% end
% Z = reshape(y,size(X));
% figure('NumberTitle', 'off', 'Name', 'lambda = 1.0');
% surf(X,Y,Z);
% 
% 
% lambda = 100;
% y = [];
% [X Y] = meshgrid(-1.5:.1:1.5,-1.5:.1:1.5);
% x = [X(:),Y(:)];
% for i =1:31
%     for j =1:31
%         x_ = [x((i-1)*31+j,1),x((i-1)*31+j,2)];
%         [y_, alpha, beta] = ComputeTPS(x_, x0, y0, lambda);
%         y = [y y_];
%     end
% end
% Z = reshape(y,size(X));
% figure('NumberTitle', 'off', 'Name', 'lambda = 100');
% surf(X,Y,Z);
%     
% %% Aufgabe 4.2.1 b):
% img = double(imread('lena.png'))/255;
% [H, W] = size(img);
% [X, Y] = meshgrid(1:W,1:H);
% 
% y_1 = [];
% x0 = [1,1;1,512;128,256;512,512;256,128;384,256;512,1;256,384];
% x = x0;
% y0 = [1;1;128;512;128;384;512;384];
% lambda = 0;
% [y, alpha, beta] = ComputeTPS(x, x0, y0, lambda);
% x = [X(:),Y(:)];
% for i =1:H
%     for j =1:W
%         x_ = [x((i-1)*H+j,1),x((i-1)*H+j,2)];
%         [y_, alpha, beta] = ComputeTPS(x_, x0, y0, lambda);
%         y_1 = [y_1 y_];
%     end
% end
% Y_1 = reshape(y_1,size(X));
% 
% 
% 
% y_2 = [];
% x0 = [1,1;1,512;128,256;512,512;256,128;384,256;512,1;256,384];
% x = x0;
% y0 = [1;512;384;512;128;128;1;384];
% lambda = 0;
% [y, alpha, beta] = ComputeTPS(x, x0, y0, lambda);
% x = [X(:),Y(:)];
% for i =1:H
%     for j =1:W
%         x_ = [x((i-1)*H+j,1),x((i-1)*H+j,2)];
%         [y_, alpha, beta] = ComputeTPS(x_, x0, y0, lambda);
%         y_2 = [y_2 y_];
%     end
% end
% Y_2 = reshape(y_2,size(Y));
% 
% img_warped = interp2(X,Y,img,Y_1,Y_2);
% figure('NumberTitle', 'off', 'Name', 'lena_warped');
% imshow(img_warped);
% imwrite(img_warped, sprintf('lena_warped.png'));
toc