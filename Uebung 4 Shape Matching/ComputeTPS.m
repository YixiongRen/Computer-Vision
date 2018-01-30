function [y, alpha, beta] = ComputeTPS(x, x0, y0, lambda)

  N = size(x0, 1);
  M = size(x, 1);
  
  TPS_0 = zeros(N+3,N+3);
  
  K = zeros(N,N);
  P = zeros(3,N);
  TPS_Parameter = zeros(N+3,1);
  alpha = zeros(N,1);
  beta = zeros(3,1);
  Y_0 = zeros(N+3,1);
  y = zeros(M,1);
  
  %%                    P
  for i =1:3
      for j =1:N
          if i==1
              P(i,j) = 1;
          else
          P(i,j) = x0(j,i-1);
          end
      end
  end

  %%                    K
  for i =1:N
      for j =1:N
          r_2 = (x0(i,1)-x0(j,1))^2+(x0(i,2)-x0(j,2))^2;
          if i==j&&r_2==0
              K(i,j) = lambda;
          elseif i==j&&r_2~=0
              K(i,j) = lambda+r_2*log(r_2);
          else
          K(i,j) = r_2*log(r_2);
          end
      end
  end
  
  %%                    TPS_0 
  for i =1:N
      for j =1:N
          TPS_0(i,j) = K(i,j);
      end
  end
  for i =1:N
      for j =1:3
          TPS_0(i,N+j) = P(j,i);
          TPS_0(j+N,i) = P(j,i);
      end
  end
  
  %%                    Y_0
  for i =1:N
      Y_0(i,1) = y0(i,1);
  end
  
  %%                    TPS_Parameter berechnen(alpha + Beta)
  TPS_Parameter = TPS_0^(-1)*Y_0;
  
  for i =1:N+3
      if i<N+1
          alpha(i,1) = TPS_Parameter(i,1);
      else
          beta(i-N,1) = TPS_Parameter(i,1);
      end
  end
  
  %%                    neues Y berechnen
  
  for i =1:M
      y_teil = beta(1,1)+beta(2,1)*x(i,1)+beta(3,1)*x(i,2);      
      for j =1:N
        r_2 = (x(i,1)-x0(j,1))^2+(x(i,2)-x0(j,2))^2;
        if i==j
            y_teil = y_teil + alpha(i,1)*lambda + alpha(i,1)*r_2*log((1-r_2)*(r_2==0)+r_2); % for one element x, lambda*alpha(1,1)
        else
            y_teil = y_teil + alpha(j,1)*r_2*log((1-r_2)*(r_2==0)+r_2);
        end
      end
      y(i,1) = y_teil;
  end
end