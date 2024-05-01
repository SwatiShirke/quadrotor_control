function params = system_parameters()
params.g = 9.81; %gravity
params.m = 0.5; %mass
params.l = 0.2; %length of arm from com
params.i11 = 1.24; %inertia
params.i22 = 1.24; %inertia
params.i33 = 2.48; %inertia
params.sigma = 0.01; % proportionality constant
params.mu = 3.0;  %max thrust of each rotor
end