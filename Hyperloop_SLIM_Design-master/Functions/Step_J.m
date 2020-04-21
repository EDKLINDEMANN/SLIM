%% flowchart step J

% estimate cross sectional area of the copper wire A_w, slot area A_s and
% the slot depth h_s

% total cross sectional area of the wire A_wt also calculated for fun

A_w = Iprime_1 / J_1 / N_c;
A_wt = N_c * A_w;
A_s = (10/7) * N_c * A_w;
