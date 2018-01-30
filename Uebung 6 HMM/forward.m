function [ P,alpha ] = forward( O,A,B,p0 )
%FORWARD Summary of this function goes here
%   Detailed explanation goes here
	[Ax,Ay]=size(A);
    [Bx,By]=size(B);
    [Ox,Oy]=size(O);
    alpha = zeros(Oy,Bx);
    

    for i = 1:Bx
        alpha(1,i) = p0(1,i)*B(i,O(1,1));  
    end
 
    
    for t = 2:Oy
        for i = 1:Bx
            for j = 1:Ax
                alpha(t,i) = alpha(t,i) + alpha(t-1,j) * A(j,i) * B(i,O(1,t));
            end
        end
    end
    
    P = 0;
    for i = 1:Bx
        P = P + alpha(Oy,i);
    end
                
    
end

