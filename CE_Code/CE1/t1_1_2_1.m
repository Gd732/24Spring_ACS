s = tf('s');
gs = (s - 1)/(s^2 + 2*s + 10);

omega = logspace(-1, 4, 5000);
[G_amp, ~] = bode(gs, omega);
G_amp = squeeze(G_amp);

inf_norm = max(G_amp);

disp("Inf norm =");
disp(inf_norm);