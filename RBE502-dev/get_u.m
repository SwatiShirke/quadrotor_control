function u = get_u(K, z, z_d)
params = system_parameters();
u_d = [1;1;1;1]*params.m*params.g/4;
error = (z-z_d);
%u = u_d + K*(z - z_d);
%u = u_d + K *(z_d - z);
%tp = K *error
u = u_d  - K *(error);
end