function y = fzero_h(m_1, z_p, r_1, U_1N, r_2s, omega_1, M_N, k_s, x_s1, x_s2s, h_0)
    function y = h(x)
        k_r = x*(sinh(2*x) + sin(2*x))/(cosh(2*x)-cos(2*x));
        k_x = 3/(2*x)*(sinh(2*x)-sin(2*x))/(cosh(2*x)-cos(2*x));
        mu_s = m_1*z_p*U_1N^2*r_2s*k_r/(omega_1*((r_1+r_2s*k_r)^2 + (x_s1 + x_s2s*k_x)^2)*M_N);
        y = mu_s - k_s;
    end

    y = fzero(@h, h_0);
end