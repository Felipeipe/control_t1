L_fc = 2;
R_fc = 0.7;
L_b = 3*10^-3;
R_b = 0.3;
C_L = 4000*10^-6;
R_L = 10;

Z_fc = tf([L_fc R_fc], 1);
Z_b = tf([L_b R_b], 1);

%% Planta batería Int
den_b_int = Z_b; 
sys_b_num = 1;
sys_b_den = [L_b R_b]; 
sys_b_int = tf(sys_b_num, sys_b_den); % Planta de la corriente de la batería
% rltool(sys_b_int)

%% Planta de carga
load_voltage_num = R_L;
load_voltage_den = [C_L*R_L 1];
load_voltage = tf(load_voltage_num, load_voltage_den); % Planta de voltaje de carga
% rltool(load_voltage)

%% Planta Full Cell

sys_fc_num = 1;
sys_fc_den = [L_fc R_fc];
sys_fc = tf(sys_fc_num, sys_fc_den);

% rltool(sys_fc)

%% Calculo ganancia Antiwindup

limit()