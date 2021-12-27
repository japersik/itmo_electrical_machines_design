%%  Решатель расчётного задания по трансформаторам
%   @author https://github.com/japersik

clear 
%% task 1
% Условия варианта
H = 105.5   %мм
L = 123     %мм
a = 35      %мм
b = 22      %мм
c = 52      %мм
h = 61.5    %мм
U_2 = 50    %В

 f = 50;
 U_1 = 230;
 Kfe = 0.9;
 K_b = 0.25;
 j = 2.5;
 delta = 0.05;
 B_max = 1.5;
 %расчёт недостающих размеров: 
 
 d = (L-a-2*b)/2
 e = (H-h-delta)/2
 l_e = (L-d)/2+e
 
 %расчёт площадей сечения:
 Sb = b*h
 Sd = d*c*Kfe
 Sfe = a*c*Kfe
 Sdelta  = a*c 
 Sdelta2 = d*c
 Se = e*c*Kfe
 
 %Задание 1

 B_0 = B_max;
 I_p = Sb*K_b/2*j;
 I_mu = I_p;
 frac_I_mu_I_p = I_mu/I_p;
    
 while frac_I_mu_I_p > 0.4
    %главный
    B_a = B_0;
     Ha = get_H_B(B_a)*100;
    Ua = Ha * h* 10^(-3);
     
     %боковой
    B_d = Sfe/(2*Sd) * B_0;
    Hd = get_H_B(B_d)*100;
    Ud = Hd * h* 10^(-3);
  
    %ярмо
    B_e = Sfe/(2*Se)*B_0;
     He = get_H_B(B_e)*100;
    Ue = He * l_e*2* 10^(-3);
     
    %боковой зазор
    Hdelta2 = B_d/(sqrt(2)*4*pi*10^(-7));
     Udelta2 = Hdelta2*delta*10^(-3);
    %главынй зазор
    Hdelta = B_0/(sqrt(2)*4*pi()*10^(-7));
    Udelta = Hdelta*delta*10^(-3);
   
    I_mu = Udelta+Udelta2+Ua+Ue+Ud;
   
    frac_I_mu_I_p = I_mu/I_p
    B_0 = B_0-0.0001
 end
%% task 2
% Мощность трансформатора
S  = 2.22*f*B_0*Sfe*10^(-6)*Sb*K_b*j
% Коэф трансформации: 
k = U_1/U_2
% Число витков в первичной и вторичной обмотках
w_1 = U_1/(4.44*f*B_0*Sfe*10^(-6))
w_2 =w_1/k
% Номинальный ток первичной, вторичной обмоток 
I_1n = I_p/(w_1)
I_2n = I_p/(w_2)
% Минимальная площадь проводников 
s_11 = I_1n/j
s_22 = I_2n/j
% Табличные площади сечения и удельные сопротивления проводников
[s_1, p_1] = get_SP_s(s_11)   
[s_2, p_2] = get_SP_s(s_22)  
% Длина витка обмоток: 
Lw1 = 2*(a+c+3*b)*10^(-3) 
Lw2 = 2*(a+c+b)*10^(-3)
% Сопротивление проводов:
R1 = Lw1 *p_1*w_1
R2 = Lw2 *p_2*w_2
%% Задание 3
% Потери в меди 
Pcu = R1*I_1n*I_1n+R2*I_2n*I_2n
% p,q: 
s = get_q_B(B_a)
q_d = get_q_B(B_d)
q_e = get_q_B(B_e)
p_a = get_p_B(B_a)
p_d = get_p_B(B_d)
p_e = get_p_B(B_e) 
% Масса элементов сердечника трансформатора
y = 7.8
V_a = a*h*c*10^(-6)
G_a = V_a*y

V_d = d*h*c*10^(-6)
G_d = V_d*y

V_e = e*c*l_e*10^(-6)
G_e = V_e*y

% Потери в сердечнике
P_Fe = G_a*p_a+2*G_e*p_e+2*G_d*p_d
Q_Fe = G_a*q_a+2*G_e*q_e+2*G_d*q_d
I_0 = I_mu/w_1
P = R1*I_0^2 + P_Fe 


% Коэф мощности в режиме ХХ
cos_phi = 1/sqrt(1+(Q_Fe/P)^2)
% Оптимальный коэффициент нагрузки
beta_max = sqrt(P_Fe / Pcu)

% номинальный и максимальынй КПД
mu_n = U_1*I_1n/(U_1*I_1n + P_Fe + Pcu)
mu_max = beta_max*U_1*I_1n/(beta_max*U_1*I_1n + P_Fe + Pcu*beta_max^2)
