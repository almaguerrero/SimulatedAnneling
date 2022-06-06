function model = SolInit()
X1 = 0:0.1:100; % LIMITES
X1_v =X1(randi([1,numel(X1)]));
X2 = 13:0.1:100; % LIMITES
X2_v = X2(randi([1,numel(X2)]));


penal_x1 = randn();

Cost = (X1_v-10)^3 + (X2_v-20)^3;
R1 = -(X1_v-5)^2 - (X2_v-5)^2 + 100;
R2 = (X1_v-6)^2 + (X2_v-5)^2 - 82.81;
if R1 > 0 || R2 > 0
   FCOST = Cost + penal_x1;
end
FCOST = Cost

     model.X1 = X1_v;
     model.X2 = X2_v;
     model.Cost = FCOST;
     model.R1 = R1;
     model.R2 = R2;
 end