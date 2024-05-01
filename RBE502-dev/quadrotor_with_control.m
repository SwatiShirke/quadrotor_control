function dz = quadrotor_with_control(z,z_d, r, n,K)
u = get_u(K, z, z_d);
dz = dynamics(z, u, r, n);
end
