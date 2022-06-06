%%costo y restricciones
function costos = CostFuntionVecino(values)
X1_v = values(1);
X2_v = values(2);


Cost = (X1_v-10)^3 + (X2_v-20)^3;
R1 = -(X1_v-5)^2 - (X2_v-5)^2 + 100;
R2 = (X1_v-6)^2 + (X2_v-5)^2 - 82.81;
%penalizar por separado
%evolución pareja de las penalizaciones
if R1 > 0 || R2 > 0
  penal_x1 = randn();
  costos = 1; 
end
costos = [Cost,R1,R2];
end