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
