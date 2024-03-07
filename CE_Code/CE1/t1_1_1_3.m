s = tf('s');
gs = (s - 1)/(s^2 + 2*s + 10);
[gt, t] = impulse(gs);
appro_impluse = trapz(t, gt.^2);
two_norm = sqrt(appro_impluse);

disp("Two norm =");
disp(two_norm_i);