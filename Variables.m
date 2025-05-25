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
K_battery_current = 6.415;
zero_battery_current = 916;
C_battery_current_num = [1 zero_battery_current];
C_battery_current_den = [1 0];

%% Planta de carga
load_voltage_num = R_L;
load_voltage_den = [C_L*R_L 1];
load_voltage = tf(load_voltage_num, load_voltage_den); % Planta de voltaje de carga
% rltool(load_voltage)
K_voltage = 0.7975;
zero_voltage = 98.6;
C_load_volt_num = [1 zero_voltage];
C_load_volt_den = [1 0];

%% Planta Full Cell

sys_fc_num = 1;
sys_fc_den = [L_fc R_fc];
sys_fc = tf(sys_fc_num, sys_fc_den);
K_cell_current = 13.69;
zero_cell_current = 2.33;
C_cell_current_num = [1 zero_cell_current];
C_cell_current_den = [1 0];
% rltool(sys_fc)

%% Calculo ganancia Antiwindup


k_bat_inf = K_battery_current;

bat_awu_num = -zero_battery_current;
bat_awu_den = [k_bat_inf zero_battery_current*k_bat_inf];

k_cell_inf = K_cell_current;

cell_awu_num = -zero_cell_current;
cell_awu_den = [k_cell_inf zero_cell_current*k_cell_inf];


cell_awu = tf(cell_awu_num,cell_awu_den);
bat_awu = tf(bat_awu_num, bat_awu_den);
