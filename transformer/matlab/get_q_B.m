%% Получить удельную реактивную мощность по индукции
%   @author https://github.com/Vvlad1slavV

function y = f(x)
  B_table = [0, 0.5, 1, 1.25, 1.5, 1.6, 1.7, 1.8, 1.9, 2];
  q_table = [0, 0.43, 1.7, 5.7, 20.5, 32.5, 41.5, 73, 110, 180];
  
  y = nan(size(x));
  y(x < 0) = 0;
  n = 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[q_table(n), q_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[q_table(n), q_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[q_table(n), q_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[q_table(n), q_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[q_table(n), q_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[q_table(n), q_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[q_table(n), q_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[q_table(n), q_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
end

