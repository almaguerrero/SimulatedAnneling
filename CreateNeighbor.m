function vecino = CreateNeighbor(x);
valor_X1 = x.X1;
valor_X2 = x.X2;
step_size = 0.1;
vecino_X1 = valor_X1+randn*step_size;
vecino_X2 = valor_X2+randn*step_size;

V = [vecino_X1 vecino_X2];

costo = CostFuntionVecino(V);
if costo == 1
    vecino_X1 = valor_X1+randn*step_size;
   vecino_X2 = valor_X2+randn*step_size;
   V = [vecino_X1 vecino_X2];
   costo = CostFuntionVecino(V);
else
vecino.X1 = vecino_X1;
vecino.X2 = vecino_X2;
vecino.Cost = costo(1);
vecino.R1 = costo(2);
vecino.R2 = costo(3);
%end
end