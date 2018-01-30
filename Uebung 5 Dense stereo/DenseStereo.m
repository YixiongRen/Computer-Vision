function DenseStereo(LeftImageFileName, RightImageFileName, DepthMapFileName)

  left=imread(LeftImageFileName);
  right=imread(RightImageFileName);
  if isinteger(left)
    left = double(left)/255;
    if size(left, 3) > 1
      left = mean(left, 3);
    end
  end
  if isinteger(right)
    right = double(right)/255;
    if size(right, 3) > 1
      right = mean(right, 3);
    end
  end

  Y = size(left, 1);
  depth = zeros(size(left));
  for y=1:Y
    [pathS, pathT, C, D] = DTW(left(y,:), right(y,:));
    for i=1:length(pathS)
        
       depth(y,pathT(i)) = abs(pathS(i) - pathT(i));
    end
  end
%   depth = medfilt2(depth,[3,3]);
  maxdepth = max(depth(:));
  depthImg = depth/maxdepth;
  
  imshow(depthImg);
  imwrite(depthImg, DepthMapFileName);

end