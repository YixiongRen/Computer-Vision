%% Exercise 5:
tic
close all;

%% Aufgabe 5.2.1 a):
s = [2,6,5,3];
t = [1,5,3,4];
[pathS, pathT, C, D] = DTW(s, t);

%% Aufgabe 5.2.1 b):

% DenseStereo('Left.png', 'Right.png', 'Depth.png');
toc