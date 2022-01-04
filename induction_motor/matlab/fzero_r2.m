function r_2 = fzero_r2(m_1, z_p, r_1, cosfi_1N, s_N, lymbda, U_1N, I_1N, M_N, omega_1, r_20s)
    
 function y = count_r2(x)
        a = r_1/x;
        A = 1 - 2*a*s_N*(lymbda-1);
        s_m = s_N*(lymbda + sqrt(lymbda^2 - A))/A;
        x_ks = sqrt((x/s_m)^2-r_1^2);
        b = x_ks/((r_1 + x/s_N)^2 + x_ks^2);
        x_m = 1/((I_1N*sqrt(1-cosfi_1N^2))/U_1N - b);
        I_2s = U_1N/sqrt((r_1 + x/s_m)^2 + x_ks^2);
        mu = m_1*z_p*I_2s^2*x/(omega_1*s_m*M_N);
        y = mu - lymbda;
    end
    r_2 = fzero(@count_r2, r_20s);
   
end