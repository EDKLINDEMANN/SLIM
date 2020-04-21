%% Flowchart step K

g_0 = g_m + d; %magnetic air gap
gamma = (4/pi)*(w_s/(2*g_0)*atan(w_s/(2*g_0)) - ln(sqrt(1+(w_s/(2*g_0))^2)));
k_c = lambda / (lambda - gamma*g_0); %Carter's coefficient
g_e = k_c * g_0; %effective air gap
G = (2*mu_0*f*(tau^2)) / (pi*(rho_r/d)*g_e); %goodness factor