A = [20, -27, 7;
     53, -63, 13;
     -5, 12, -8];
B = [1, -1;
    -2, -1;
    -3, 0];
C = [0, 0, -2;
     1, -1, -1];
D = [0, 0;
     0, 0];

s = tf('s');
Gs = C*inv(s*eye(3)-A)*B+D;
omega = logspace(-1, 4, 1000);
[G_amp, ~] = bode(Gs, omega);

svd_vector = zeros(1, 1000);
for i = 1:1000
    svd_vector(i) = max(svd(G_amp(:,:,i)));
end

inf_norm_f = max(svd_vector);
disp("Inf norm = "); 
disp(inf_norm_f);