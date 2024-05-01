
function [A,B] = linearized_dynamics()
params = system_parameters();
a22 = [0,0,0,0, params.g, 0;
    0,0,0, -params.g,0,0;
    0,0,0,0,0,0;
    0,0,0,0,0,0;
    0,0,0,0,0,0;
    0,0,0,0,0,0];
A = [zeros(6), eye(6); a22, zeros(6)];
B2 = [zeros(2,4); 1/params.m*ones(1,4); 
    0, params.l/params.i11, 0, -params.l/params.i11;
    -params.l/params.i22, 0, params.l/params.i22, 0;
    params.sigma/params.i33, -params.sigma/params.i33, params.sigma/params.i33, -params.sigma/params.i33];

B = [zeros(6,4); B2];

end











 