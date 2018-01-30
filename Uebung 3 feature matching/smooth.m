% I_Gauss = smooth(I, sigma)
%   I     : Eingangsbild
%   sigma : Glättungsfaktor

function I_Gauss = smooth(I, sigma)
   
  filterSize = floor( 3*sigma )*2+1; % window size
  gaussFilter = fspecial('gaussian', filterSize, sigma);
    %{0.000006586,0.000424781,0.01330373,0.000424781,0.000006586;...                  
%                  0.000424781,0.0273984,0.109878,0.0273984,0.000424781;...
%                  0.01330373,0.109878,0.440655,0.109878,0.01330373;...
%                  0.000424781,0.0273984,0.109878,0.0273984,0.000424781;...
%                  0.000006586,0.000424781,0.01330373,0.000424781,0.000006586};

             I_Gauss = conv2(I, gaussFilter, 'same');

end