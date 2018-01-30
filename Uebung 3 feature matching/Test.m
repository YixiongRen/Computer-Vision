%% Exercise 3:

close all;

%% Aufgabe 3.2.1 a):


I_DoG = cell(8, 1);
I_DoG{1,1} = imread('DoG01.png');
if isinteger(I_DoG{1,1})
    I_DoG{1,1} = double(I_DoG{1,1})/255;
    if size(I_DoG{1,1}, 3) > 1
      I = mean(I_DoG{1,1}, 3);
    end
end
I_DoG{2,1} = imread('DoG02.png');
if isinteger(I_DoG{2,1})
    I_DoG{2,1} = double(I_DoG{2,1})/255;
    if size(I_DoG{2,1}, 3) > 1
      I = mean(I_DoG{2,1}, 3);
    end
end
I_DoG{3,1} = imread('DoG03.png');
if isinteger(I_DoG{3,1})
    I_DoG{3,1} = double(I_DoG{3,1})/255;
    if size(I_DoG{3,1}, 3) > 1
      I = mean(I_DoG{3,1}, 3);
    end
end
I_DoG{4,1} = imread('DoG04.png');
if isinteger(I_DoG{4,1})
    I_DoG{4,1} = double(I_DoG{4,1})/255;
    if size(I_DoG{4,1}, 3) > 1
      I = mean(I_DoG{4,1}, 3);
    end
end
I_DoG{5,1} = imread('DoG05.png');
if isinteger(I_DoG{5,1})
    I_DoG{5,1} = double(I_DoG{5,1})/255;
    if size(I_DoG{5,1}, 3) > 1
      I = mean(I_DoG{5,1}, 3);
    end
end
I_DoG{6,1} = imread('DoG06.png');
if isinteger(I_DoG{6,1})
    I_DoG{6,1} = double(I_DoG{6,1})/255;
    if size(I_DoG{6,1}, 3) > 1
      I = mean(I_DoG{6,1}, 3);
    end
end
I_DoG{7,1} = imread('DoG07.png');
if isinteger(I_DoG{7,1})
    I_DoG{7,1} = double(I_DoG{7,1})/255;
    if size(I_DoG{7,1}, 3) > 1
      I = mean(I_DoG{7,1}, 3);
    end
end
I_DoG{8,1} = imread('DoG08.png');
if isinteger(I_DoG{8,1})
    I_DoG{8,1} = double(I_DoG{8,1})/255;
    if size(I_DoG{8,1}, 3) > 1
      I = mean(I_DoG{8,1}, 3);
    end
end


%% Aufgabe 3.2.1 b):

[x, y] = ExtractPoints(I_DoG);

figure;
imshow(I);
hold on;
plot(x, y, 'xr');
hold off;
