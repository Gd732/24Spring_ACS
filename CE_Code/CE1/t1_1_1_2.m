% by approximation of the integral
s = tf('s');
gs = (s - 1)/(s^2 + 2*s + 10);

omega = logspace(-2, 6, 10000);
[G_amp, ~] = bode(gs, omega);
G_amp = squeeze(G_amp);

appro_i = trapz(omega, G_amp.^2)/(2*pi);
two_norm_i = sqrt(2*appro_i);
two_norm = norm(gs, 2);

e = abs(two_norm-two_norm_i)/(two_norm)*100;

disp("Two norm =");
disp(two_norm_i);