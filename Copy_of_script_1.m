L_fc = 2;
R_fc = 0.7;
L_b = 3*10^-3;
R_b = 0.3;
C_L = 4000*10^-6;
R_L = 10;

Z_fc = tf([L_fc R_fc],1);
Z_b = tf([L_b R_b],1);
Z_L = tf(C_L,[1 C_L/R_L]);

%% Planta batería
den_b = Z_b + Z_L;
sys_b = 1/den_b;
rltool(sys_b)

%% Planta Full Celd
den_fc = Z_fc + Z_L;
sys_fc = 1/den_fc;
rltool(sys_fc)

%% Planta Carga
sys_VL = Z_L;
rltool(sys_VL)