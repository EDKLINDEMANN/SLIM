%%At Rated Vc this calculates the finals values for Actual SLIM thrust,F_S,
%%SLIM output power,P_o, SLIM input power, P_i, and efficiency,eta

F_s=(m*I_2^2*R_2)/((V_r/(1-S))*S);
P_o = F_s*V_r;
P_i=F_s*V_s+m*I_1^2*R_1;
eta=P_o/P_i;