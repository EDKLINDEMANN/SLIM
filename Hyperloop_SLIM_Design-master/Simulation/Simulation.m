%% Step A 
mu_0=4*pi*10^-7;        %Permibility of free space (H/m) 
rho_w=19.27*10^-9;      %Copper volume resistivity (ohm-m)
rho_r=28.85*10-9;       %Capsule conductor volume resistivity (ohm-m)
B_tmax=input('Max tooth flux density, B_tmax, (Wb/m^2)  '); %Input max tooth flux density  
B_ymax=input('Max yoke flux density, B_ymax, Wb/m^2)   ');  %Input max yoke flux density

%% Step B
% user inputs
m = input('Number of Phases: ');                    %input for number of phases 
Vline = input('Line-to-Line voltage: ');       %input for line to line voltage
f = input('Electrical frequency: ');                %input for frequency [Hz]
p = input('Number of poles: ');                     %input for number of poles
q_1 = input('Number of slot-per-pole-per-phase: '); %input for number of slot per-pole-per-phase
S = input('Rated slip: ');                          %input for rated slip
W_s = input('Stator width [m]: ');                  %input for stator width [m]
J_1 = input('Stator current density [A/m^2]: ');    %input for stator current density [A/m^2]
g_m = input('Air gap [m]: ');                       %Input desired mechanical air gap
d = input('Rotor outer wall thickness [m]: ');      %input aluminum thickness
theta_p = input('Coil span [electrical degrees]: ');

%% Step C 
Fprime_s=input('Target electromagnetic thrust, Fs   ');
V_r=input('Rated rotor velocity, Vr   ');

%% Step D
% calculate synchronous velocity (V sub s)
V_s = V_r/(1-S);

%% Step E
tau=V_s/2*f;            %calculate the pole pitch
lambda=tau/m*q_1        %calculate slot pitch
L_s=p*tau               %length of one stator unit 

%% Step F
% assume w_s = w_t = lambda/2 [lambda: slot pitch] 
w_s = lambda / 2; %slot width
w_t = w_s;        %tooth width
N_c = 1;          %number of turns per slot

%% Step G
N_1 = N_c * p * q_1; %number of turns per phase

%% Step h
eacosp = 0.69420; %eta*cos(phi) = between 0 and 1

%% Step I
% estimate rated RMS stator current, I-prime sub 1
V_1 = Vline/sqrt(3);
Iprime_1 = (Fprime_s * V_r)/(m*V_1*eacosp); 

%% Step J

% estimate cross sectional area of the copper wire A_w, slot area A_s and
% the slot depth h_s

% total cross sectional area of the wire A_wt also calculated for fun

A_w = Iprime_1 / J_1 / N_c;
A_wt = N_c * A_w;
A_s = (10/7) * N_c * A_w;

%% Step K

g_0 = g_m + d; %magnetic air gap
gamma = (4/pi)*(w_s/(2*g_0)*atan(w_s/(2*g_0)) - log(sqrt(1+(w_s/(2*g_0))^2)));
k_c = lambda / (lambda - gamma*g_0); %Carter's coefficient
g_e = k_c * g_0; %effective air gap
G = (2*mu_0*f*(tau^2)) / (pi*(rho_r/d)*g_e); %goodness factor

%% Step L
l_w1 = 2*(W_s+l_ce);
l_w = N_1*l_w1;
a = pi/(m*q_1);
k_p = sin(theta_p/2);
k_d = (sin((q_1*a)/2)/q_1*sin(a/2));
W_se = W_s + g_0;
k_w = k_p*k_d;

%% Step M
R_1 = (lambda_w*((l_w)/(A_wt)));

lambda_s = ((h_s)*(1+3*k_p))/12*W_s
lambda_e = 0.3*((3*k_p)-1)
lambda_d = 5*((G_e)/(W_s))/5 + 4*((G_0)/(W_s))
X_1 = (2*mu_0*pi*f*((lambda_s*(1+(3/p))+lambda_d)*(W_s/q_1)+lambda_e*l_ce)*(N_1)^2)/p

X_m = (24*mu_0*pi*f*w_se*k_w*((n_1)^2)*tau)/(pi^2)*p*g
R_2 = (x_m)/(G)

%% Step N
Z = R_1 + (j*X_1) + (j*((R_2/S)*X_m))/((R_2/S)+ J*X_m)

cos_phi = F_s*2*pi*f_1 + 3*R_1*(I_1)^2
I_1 = (V_1)/abs(Z)
I_m = (I_1 * R_2)/sqrt((R_2)^2 + (S*X_m)^2)

%% Step O 
S=(V_s-V_r)/V_s;                %Calculating slip
I_2=I_1/sqrt((1/(S*G)^2)+1);    %Calculating equivalent circuit
P_o=m*I_2^2*R_2((1-S)/S);       %Calculating output power 
F_s=(m*I_2^2*R_2)/(V_s*S);      %Calculating thrust 
P_i=F_s*V_s+m*I_1^2*R_1;        %Calculating input power 
eta=P_o/P_i;                    %efficency 

%% Step P 
eccosp=eta*cos(phi);
while abs(eccosp-eacosp)>.0001
    eacosp=(eacosp+eccosp)/2;
    %go to step i 
end
while abs(F_s-Fprime_s)>.0001
    N_c=N_c+1
    % go to step g 
end

%% Step s
%finding neew values for slot width,W_s, and tooth width,W-t,
w_s=D_w*N_p+2*t_I;
w_t=lambda-w_s;

%% Step t
%recalculating all these variable to recalculate G (goodness factor)
g_e=k_c*g_0;                    %Effective air gap
k_c=(lambda)/(lambda-gamma*g_0) %carter's coefficient
W_se= W_s+ g_0;                 %Equivalent stator width

%% Step U
R_1 = (lambda_w*((l_w)/(A_wt)));
X_1 = (2*mu_0*pi*f*((lambda_s*(1+(3/p))+lambda_d)*(W_s/q_1)+lambda_e*l_ce)*(N_1)^2)/p
X_m = (24*mu_0*pi*f*w_se*k_w*((n_1)^2)*tau)/(pi^2)*p*g
R_2 = (x_m)/(G)

%% Step V
W_tmin=((2*sqrt(2))*m*k_w*N_i*I_m*mu_0*lambda)/(pi*g_e*p*B_tmax);  %minimum tooth density
%if minimum is greater than the actual width, change number of parallel wires and their arrangement inside  slot

%% Step W
J_1 = (I_l)/(A_w)

%% Step_X

h_y = (flux_p)/(2*B_ymax*W_s)

%% Step Y
%%At Rated Vc this calculates the finals values for Actual SLIM thrust,F_S,
%%SLIM output power,P_o, SLIM input power, P_i, and efficiency,eta

F_s=(m*I_2^2*R_2)/((V_r/(1-S))*S);
P_o = F_s*V_r;
P_i=F_s*V_s+m*I_1^2*R_1;
eta=P_o/P_i;







%% Wire Lists 
AWG_gauge=[0000,00,00,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32];
Diameter=[11.684,10.4038,9.26592,8.25246,7.3482,6.543,5.8267,5.1892,4.6202,4.1148,3.6652,3.2639,2.90576,2.58826,2.05232,1.8288,1.62814,1.45034,1.29032,1.29032,1.15062,1.02362,.91186,.8128,.7239,.6451,.5740,.4546,.4038,.3607,.3200,.2870,.254,.226,.203];
Ohms_per_Km=[.1607,.2027,.2555,.3224,.4064,.5126,.6461,.8151,1.0276,1.2959,1.6343,2.0605,2.5981,3.2764,4.1328,5.2086,6.5698,8.282,10.443,13.173,16.61,20.943,26.407,33.292,41.984,52.939,66.780,84.197,106.17,133.85,168.82,212.87,268.4,338.49,426.73,538.25];,
Ampacity =[312,262,220,185,156,131,110,92.3,77.6,65.2,54.8,46.1,38.7,32.5,27.3,23,19.3,16.2,13.2,11.5,9.6,8.1,8.25,10.12,12.76,16.25,20.3,25.6,32.2,40.7,51.3,64.8,81.6,103,130,164];
Ft_per_pound=[20400.0,16180.0,12830.0,10180.0,8070.0,64000,5075.0,4025.0,3192.0,2531.0,2007.0,1592.0,1262.0,1001.0,794.0,629.6,499.3,396.0,314.0,249.0,167.5,156.6,124.2,98.5,78.1,62.0,49.1,39.0,30.9,24.5,19.4,15.4,12.2,9.7,7.7,6.1];






