function [pathS, pathT, C, D] = DTW(s, t)

  n = numel(s);
  m = numel(t);

  % Kostenmatrix C aufstellen:
  C = zeros(n,m);
    for i = 1:n
        for j = 1:m
            C(i,j) = sqrt((s(i)-t(j))^2);
        end
    end

  % DTW-Matrix D aufstellen:
  D = ones(n,m) * realmax;
  D(1,1) = C(1,1);

  for i = 1:n
    for j = 1:m
        if i==1&&j==1
            continue;
        end
        if i>1
            D1 = D(i-1,j);
        else
            D1 = realmax;
        end
        if j>1&&i>1
            D2 = D(i-1,j-1); 
        else
            D2 = realmax;
        end 
        if j>1
            D3 = D(i,j-1);
        else
            D3 = realmax;
        end
        D(i,j) = C(i,j)+min([D1,D2,D3]);
    end
  end

  % Backtracking:
  pathS = [];
  pathT = [];
  i=n;
  j=m;
  
  % Korrespondierende Punkte können mit
  %   pathS(end+1, 1) = j;
  %   pathT(end+1, 1) = i;
  % hinzugefügt werden.
  pathS = [j pathS];
  pathT = [i pathT];
  while ((i>1) || (j>1))
    if (i>1) && (j>1)
        if D(i,j) == (C(i,j)+D(i-1,j))
            if i==n&&j==m
                pathS = [j pathS];
                pathT = [(i-1) pathT];
            end
            i = i-1;
        elseif D(i,j) == (C(i,j)+D(i-1,j-1))
            pathS = [(j-1) pathS];
            pathT = [(i-1) pathT];
            i = i-1;
            j = j-1;
        else
            if i==n&&j==m
                pathS = [(j-1) pathS];
                pathT = [i pathT];
            end
            j = j-1;
        end
     
    elseif (j>1)
%         pathS = [pathS (j-1)];
%         pathT = [pathT i];
        j = j-1;
    else
%         pathS = [pathS j];
%         pathT = [pathT (i-1)];
        i = i-1;
    end
  end

end