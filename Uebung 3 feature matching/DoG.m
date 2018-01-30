% I_DoG = DoG(I, sigma, s, N)
% 
%   I     : Eingabebild
%   sigma : GlÃ¤ttungsfaktor
%   s     : Anzahl Skalen pro Oktave
%   N     : Anzahl Oktaven

function I_DoG = DoG(I, sigma, s, N)

  % Vorverarbeitung des Bildes, ggf. konvertierung in double und Umwandlung in Grauwerte:
  if isinteger(I)
    I = double(I)/255;
    if size(I, 3) > 1
      I = mean(I, 3);
    end
  end
    [i,j]=size(I);
  % Hier beginnt die Aufgabe ...

  numberOfScales = s*N;
  I_Gaussian = cell(numberOfScales, 1);
  I_DoG = cell((numberOfScales-1), 1);
  
  for Octave=1:N
      for Interval=1:s
    % Skalen-Ebenen können mittels I_DoG{n} = ... beschrieben werden.
         
              I_Gaussian{(Octave-1)*3+Interval,1} = smooth(I,(2^(Octave-1))*sigma*(2^((Interval-1)/3)));
         
      end
  end
    for m=1:(numberOfScales-1)
        for n = 1:i
            for p = 1:j                
                I_DoG{m,1}(n,p) = I_Gaussian{m+1,1}(n,p)-I_Gaussian{m,1}(n,p);
            end
        end
    end
    
end
