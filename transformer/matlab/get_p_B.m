%% Получить удельную мощность потерь(А/см) в стали по  индукции(Тл)
%   @author https://github.com/Vvlad1slavV

function y = f(x)
  B_table = [0, 0.5, 1, 1.25, 1.5, 1.6, 1.7, 1.8, 1.9, 2];
  p_table = [0, 0.1, 0.5, 0.9, 1.4, 1.7, 2.0, 2.45, 3, 4];
  
  y = nan(size(x));
  y(x < 0) = 0;
  n = 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[p_table(n), p_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[p_table(n), p_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[p_table(n), p_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[p_table(n), p_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[p_table(n), p_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[p_table(n), p_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[p_table(n), p_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[p_table(n), p_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
end

