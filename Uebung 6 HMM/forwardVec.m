function [ P,alpha ] = forwardVec( O,A,B,p0 )
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
	[Ax,Ay]=size(A);
    [Bx,By]=size(B);
    [Ox,Oy]=size(O);
    alpha = zeros(Oy,Bx);
    


	alpha(1,:) = p0(1,:).*B(:,O(1,1))';  

 
    
    for t = 2:Oy
        alpha(t,:) = alpha(t,:) + alpha(t-1,1:Ax) * A(1:Ax,:).* B(:,O(1,t))';                 
    end
    


    P = sum(alpha(Oy,:));

                
    
end



