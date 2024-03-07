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
Gs_star = ctranspose(Gs);
H = Gs_star*Gs;

omega = logspace(-2, 5, 1000);
[H_amp, ~] = bode(H, omega);

trace_vector = zeros(1, 1000);
for i = 1:1000
    trace_vector(i) = trace(H_amp(:,:,i));
end

two_norm_i = trapz(omega, trace_vector)/(2*pi);
two_norm_i = sqrt(two_norm_i*2);
disp("Two norm =");
disp(two_norm_i);