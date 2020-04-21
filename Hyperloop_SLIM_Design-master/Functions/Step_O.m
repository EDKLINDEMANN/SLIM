%% Step O 
S=(V_s-V_r)/V_s;                %Calculating slip
I_2=I_1/sqrt((1/(S*G)^2)+1);    %Calculating equivalent circuit
P_o=m*I_2^2*R_2((1-S)/S);       %Calculating output power 
F_s=(m*I_2^2*R_2)/(V_s*S);      %Calculating thrust 
P_i=F_s*V_s+m*I_1^2*R_1;        %Calculating input power 
eta=P_o/P_i;                    %efficency 
