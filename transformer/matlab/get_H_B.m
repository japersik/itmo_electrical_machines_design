%% Получить напряженность по  индукцию
%   @author https://github.com/Vvlad1slavV

function y = f(x)
  % set default
  
  B_table = [0, 0.5, 1, 1.25, 1.5, 1.6, 1.7, 1.8, 1.9, 2];
  H_table = [0, 0.3, 0.6, 1.6, 4.8, 7.2, 8.6, 14.2, 24, 40];
  
  y = nan(size(x));
  y(x < 0) = 0;
  n = 1; 
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[H_table(n), H_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[H_table(n), H_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[H_table(n), H_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[H_table(n), H_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[H_table(n), H_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[H_table(n), H_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
  ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[H_table(n), H_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
    ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[H_table(n), H_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
      ind = (B_table(n) <= x) & (x < B_table(n+1));
  k = polyfit([B_table(n), B_table(n+1)],[H_table(n), H_table(n+1)], 1);
  y(ind) = x*k(1) + k(2);
  n = n + 1;
  
end

