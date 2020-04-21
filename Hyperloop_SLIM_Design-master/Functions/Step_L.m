%% Step L

l_w1 = 2*(W_s+l_ce);
l_w = N_1*l_w1;
a = pi/(m*q_1);
k_p = sin(theta_p/2);
k_d = (sin((q_1*a)/2)/q_1*sin(a/2));
W_se = W_s + g_0;
k_w = k_p*k_d;