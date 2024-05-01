function ds = combined_dynamics(s, r, n, K, t)
z = s(1:12);
b = s(13:15);
z_d = vertcat(b, [0;0;0;0;0;0;0;0;0]); %%changed 
u = get_u(K, z, z_d);
dz = dynamics(z, u, r, n);
db = bug_dynamics(t);
ds = vertcat(dz,db);
end
