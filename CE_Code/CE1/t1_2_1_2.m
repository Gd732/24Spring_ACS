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

L = lyap(A, B*B');
two_norm_ss = sqrt(trace(C*L*C'));

disp("Two norm =");
disp(two_norm_ss);