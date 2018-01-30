
close all;
%% test Forward-algorithmus
A = [0.0,0.8,0.2;
    0.3,0.0,0.7;
    0.4,0.6,0.0];
B = [0.0,0.3,0.7;
    0.2,0.6,0.2;
    0.5,0.3,0.2];

p0 = [0.2,0.3,0.5];
pi = [0.2,0.3,0.5];
O = [2,3,1];

[ P,alpha ] = forward( O,A,B,p0 );
fprintf('P_forward = %8.5f\n', P);
disp('alpha =');
disp(alpha);

[ P,alpha ] = forwardVec( O,A,B,p0 );
fprintf('P_forwardVec = %8.5f\n', P);
disp('alpha =');
disp(alpha);


%% test Vektorisierung




%% test Backward-algorithmus

[ P,beta ] = backward( O,A,B,pi );
fprintf('P_backward = %8.5f\n', P);
disp('beta =');
disp(beta);


