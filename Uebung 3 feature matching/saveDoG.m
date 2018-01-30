function saveDoG(I_DoG)

  for i=1:numel(I_DoG)
    I = I_DoG{i};
%     min(I(:))
%     max(I(:))
    normI = (I-min(I(:))) / (max(I(:))-min(I(:)));
    imwrite(normI, sprintf('DoG%.2d.png', i));
  end

end