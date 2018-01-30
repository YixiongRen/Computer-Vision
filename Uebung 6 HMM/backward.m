function [ P,beta ] = backward( O,A,B,pi )
%BACKWARD Summary of this function goes here
%   Detailed explanation goes here
    [Ax,Ay]=size(A);
    [Bx,By]=size(B);
    [Ox,Oy]=size(O);
    beta = zeros(Oy,Bx);
    
  
    beta(Oy,:) = 1;  
   
    
    for t = (Oy-1):-1:1
     
        beta(t,:) = beta(t,:) + (A(:,1:Ax)*(beta(t+1,1:Ax).* B(1:Ax,O(1,(t+1)))')')';
     
    end

 
        P = sum((pi(1,:).*beta(1,:)).*B(:,O(1,1))');



end

