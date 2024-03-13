% definition
a = ureal('a', 11, 'PlusMinus', 1);
b = ureal('b', 4, 'PlusMinus', 1);
c = ureal('c', 9, 'PlusMinus', 2);

gs = tf([a], [1, b, c]);

% 
% step(gs)
% title('step')
% xlabel('time');ylabel('amp');
% 
% nyquist(gs)
% title('Nyquist')
% xlabel('Re');ylabel('Im');

var_set = ["a", "b", "c"];
g_set20 = usample(gs, var_set, 20);
g_set200 = usample(gs, var_set, 200);

[G20, info20] = ucover(g_set20, gs, 1);
[G200, info200] = ucover(g_set200, gs, 1);

W20_1 = info20.W1;
W200_1 = info200.W1;
W20_2 = info20.W2;
W200_2 = info200.W2;

bode(W20_1)
hold on
bode(W200_1)
legend({'20 samples','200 samples'},'Location','southwest')
