
m_1 = 3;            % число фаз
p2 = 2              % число полюсов магнитного поля двигателя
f = 50              % частота питающей сети

P_N = 90*10^3;      % мощность Вт
U_N = 380;          % Линейное или фазное напряжение питания
I_1N = 157;         % Линейный или фазный ток
M_N = 290;          % Номинальный момент нагрузки
n_N = 2955;         % номинальная частота вращения
s_N = 1-n_N/3000;   % скольжение
cosfi_1N = 0.93;    % коэффициент мощности
lambda = 2.7;       % кратность максимального момента M_max/M_N
k_s = 1.8;          % кратность пускового момента
k_sI = 7;           % кратность пускового тока


U_1N = U_N/sqrt(3);
omega_1 = 2*pi*f;
omega = pi*n_N/30
z_p = p2/2

%% Расчет схема замещения

r_1 = (U_1N*I_1N*cosfi_1N - M_N*omega_1/(m_1*z_p))/I_1N^2;
r_20s = m_1*z_p*U_1N^2*s_N/(M_N*omega_1);

r_2s = fzero_r2(m_1, z_p, r_1, cosfi_1N, s_N, lambda, U_1N, I_1N, M_N, omega_1, r_20s);
a = r_1/r_2s;
A = 1 - 2*a*s_N*(lambda-1);
s_m = s_N*(lambda + sqrt(lambda^2 - A))/A;
x_ks = sqrt((r_2s/s_m)^2-r_1^2);
b = x_ks/((r_1 + r_2s/s_N)^2 + x_ks^2);
x_m = 1/((I_1N*sqrt(1-cosfi_1N^2))/U_1N - b);
I_2s = U_1N/sqrt((r_1 + r_2s/s_m)^2 + (x_m + x_ks)^2)
mu = m_1*z_p*I_2s^2*r_2s/(omega_1*s_m*M_N)
x_s1 = x_ks/2;
x_s2s = x_ks/2;


h_0 = 2;
h = fzero_h(m_1, z_p, r_1, U_1N, r_2s, omega_1, M_N, k_s, x_s1, x_s2s, h_0);

k_r = h*(sinh(2*h) + sin(2*h))/(cosh(2*h)-cos(2*h))
k_x = 3/(2*h)*(sinh(2*h)-sin(2*h))/(cosh(2*h)-cos(2*h))
mu_s = m_1*z_p*U_1N^2*r_2s*k_r/(omega_1*((r_1+r_2s*k_r)^2 + (x_s1 + x_s2s*k_x)^2)*M_N)


s = -1:0.0001:1
n = (1-s).*3000
M = m_1*z_p*r_2s*U_1N^2./(omega_1.*s.*((r_1+r_2s./s).^2 + (x_s1 + x_s2s)^2));


xi = h.*abs(s);

k_r = xi.*(sinh(2.*xi) + sin(2.*xi))./(cosh(2.*xi) - cos(2.*xi));
k_x = 3./(2.*xi).*(sinh(2.*xi) - sin(2.*xi))./(cosh(2.*xi) - cos(2.*xi));

M_k = m_1*z_p*r_2s*U_1N^2.*k_r./(omega_1.*s.*((r_1 + k_r.*r_2s./s).^2 + (x_s1 + x_s2s.*k_x).^2));

plot_xx(s,M,"$M(s)$",s,M_k,"$M_k(s)$","$s$","$M,H$")
savef_and_close('M(s) M_k(s).png')

plot_xx(M,n,"$n(M)$",M_k,n,"$n(M_k)$","$M,H$","n об/мин")
savef_and_close('n(M),n(M_k).png')

plot_xx(s,I_2s,"$I'_{2}(s)$",s,I_2sk,"$I'_{2k}(s)$","$s$","$I,A$")
savef_and_close('I_2s(s) I_2sk(s).png')

plot_xx(I_2s,n,"$n(I'_{2})$",I_2sk,n,"$n(I'_{2k})$","$I,A$","n об/мин")
savef_and_close('n(I_2s),n(I_2sk).png')

%% Рабочие характеристики без учета вытеснения тока: 
s = 0:0.00001:s_N+0.001;  % s
n = (1-s).*3000;  
M = m_1*z_p*r_2s*U_1N^2./(omega_1.*s.*((r_1+r_2s./s).^2 + (x_s1 + x_s2s)^2));
I_2s = U_1N./sqrt((r_1 + r_2s./s).^2 + (x_s1 + x_s2s)^2);
I_1 = I_2s+ U_1N/x_m;
P_2 = m_1*I_2s.*I_2s * r_2s.*(1-s)./s;
P_1 = P_2 + m_1*I_1.^2 * r_1 + m_1*I_2s.^2 * r_2s;
kpd = P_2./P_1 *100;
cos_Phi = P_1/(3*U_1N*I_1N);

plot_lable(P_2,P_1,"$P_2,W$","$P_1,W$")
savef_and_close('P_1(P_2).png')

plot_lable(P_2,kpd,"$P_2,W$","$\eta,\%$")
savef_and_close('KPD(P_2).png')

plot_lable(P_2,cos_Phi,"$P_2,W$","$\cos\phi$")
savef_and_close('cos(P_2).png')

plot_lable(P_2,n,"$P_2,W$","n, об/мин")
savef_and_close('n(P_2).png')

plot_lable(P_2,I_1,"$P_2,W$","$I_1,A$")
savef_and_close('I_1(P_2).png')
plot_lable(P_2,M,"$P_2,W$","$M_2,H$")
savef_and_close('M(P_2).png')

%% Рабочие характеристики без учета вытеснения тока: 
s = 0:0.00001:s_N+0.001;  % s
n = (1-s).*3000;  
xi = h.*abs(s);
k_r = xi.*(sinh(2.*xi) + sin(2.*xi))./(cosh(2.*xi) - cos(2.*xi));
k_x = 3./(2.*xi).*(sinh(2.*xi) - sin(2.*xi))./(cosh(2.*xi) - cos(2.*xi));

M_k = m_1*z_p*r_2s*U_1N^2.*k_r./(omega_1.*s.*((r_1 + k_r.*r_2s./s).^2 + (x_s1 + x_s2s.*k_x).^2));
I_2s = U_1N./sqrt((r_1 + r_2s.*k_r./s).^2 + (x_s1 + x_s2s.*k_x).^2);
I_1 = I_2s+ U_1N/x_m;
P_2 = m_1*I_2s.*I_2s * r_2s.*(1-s)./s;
P_1 = P_2 + m_1*I_1.^2 * r_1 + m_1*I_2s.^2 * r_2s;
kpd = P_2./P_1 *100;
cos_Phi = P_1/(3*U_1N*I_1N);

plot_lable(P_2,P_1,"$P_2,W$","$P_1,W$")
savef_and_close('P_1(P_2)k.png')

plot_lable(P_2,kpd,"$P_2,W$","$\eta,\%$")
savef_and_close('KPD(P_2)k.png')

plot_lable(P_2,cos_Phi,"$P_2,W$","$\cos\phi$")
savef_and_close('cos(P_2)k.png')

plot_lable(P_2,n,"$P_2,W$","n, об/мин")
savef_and_close('n(P_2)k.png')

plot_lable(P_2,I_1,"$P_2,W$","$I_1,A$")
savef_and_close('I_1(P_2)k.png')
plot_lable(P_2,M,"$P_2,W$","$M_2,H$")
savef_and_close('M(P_2)k.png')
