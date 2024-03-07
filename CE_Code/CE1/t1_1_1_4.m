s = tf('s');
gs = (s - 1)/(s^2 + 2*s + 10);

[A, B, C, D] = ssdata(gs);
L = lyap(A, B*B');
two_norm_ss = sqrt(trace(C*L*C'));
two_norm = norm(gs, 2);

disp("Two norm =");
disp(two_norm_i);