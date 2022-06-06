clc;
clear;
close all;
MaxIt = 5000;      % Maximum Number of Iterations
T0 = 10000;       % Initial Temp.
alpha = 0.1;     % Temp. Reduction Rate
rbd = []
% %% Initialization
% % Create and Evaluate Initial Solution
%función que me regrese una structura inicial con dos valores x2 y x2 con
%su función de costo
sol = Init();
% % % Initialize Best Solution Ever Found
BestSol = sol.Cost;
BestCost = zeros(MaxIt, 1); %Array con las mejores soluciones
% % % % Intialize Temp.
T = T0;
% % Storage
x1 = zeros(MaxIt, 1); %Array con las mejores soluciones
x2= zeros(MaxIt, 1);
rest_1= zeros(MaxIt, 1);
rest_2= zeros(MaxIt, 1);
genera= zeros(MaxIt, 1);
%%
for it = 1:MaxIt %%cambiar paro por un if
% % %new Neighbor
newsol = CreateNeighbor(sol);
if newsol.Cost <= sol.Cost % If NEWSOL is better than SOL
    sol = newsol;
% % % % %             
else % If NEWSOL is NOT better than SOL
% % % %             
 DELTA = (newsol.Cost-sol.Cost)/sol.Cost;
% % % %             
 P = exp(-DELTA/T); %%%->probabilidad
% % 
  if rand <= P
      sol = newsol;
       end
% % % %             
  end
     if newsol.Cost <= sol.Cost
              BestSol = newsol;
     end
% %    %     % Store Best Cost Ever Found
 BestCost(it) = BestSol.Cost;
 x1(it) = BestSol.X1;
x2(it) = BestSol.X2;
rest_1(it) = BestSol.R1;
rest_2(it) = BestSol.R2;
% 
% 
% % %  
% % Update Temp.
T = alpha*T;
X = ['Iteración Número ',num2str(it),' con una temperatura de: ',num2str(T), ' °C'];
%disp(X)
%  % Plot Best Solution
end
% %% Results

subplot(3,1,1)
plot(BestCost, 'LineWidth', 2);
title('Evolución de función de costo')
ylabel('Best Cost');
subplot(3,1,2)
plot(x1, 'LineWidth', 2);
title('Evolución de X1')
ylabel('X1');
subplot(3,1,3)
plot(x2, 'LineWidth', 2);
title('Evolución de X2')
xlabel('Iteration');
ylabel('Evolución de X2');

figure ();
subplot(2,1,1);
plot(rest_1,'LineWidth', 2)
title('Restricciones R1')
subplot(2,1,2); 
plot(rest_2,'LineWidth', 2)
title('Restricciones R2')
xlabel('Iteraciones');

