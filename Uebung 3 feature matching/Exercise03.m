%% Exercise 3:

close all;

%% Aufgabe 3.2.1 a):

I = imread('dredger.png');
sigma = 1.6;
s = 3;
N = 3;
I_DoG = DoG(I, sigma, s, N);

saveDoG(I_DoG);

%% Aufgabe 3.2.1 b):

[x, y] = ExtractPoints(I_DoG);

figure;
imshow(I);
hold on;
plot(x, y, 'xr');
hold off;
