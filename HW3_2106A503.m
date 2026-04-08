% MKT4834 - HW3: Tire Modeling

% --- 1. Raw Tire Data Definition --- %

% VERTICAL LOADS [N]
Fz1 = 3000;  
Fz2 = 5000;  
Fz3 = 7000;  
% LONGITUDINAL FORCE DATA (Fx vs slip ratio 's')
% Slip ratio (s) 
s_Fx = [-1, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, -0.06, -0.04, -0.03, -0.02, -0.01, 0, 0.01, 0.02, 0.03, 0.04, 0.06, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
% Fx values 
Fx_3000 = [-2836.87, -2878.21, -2928.14, -2989.40, -3065.79, -3162.28, -3283.66, -3424.53, -3505.35, -2974.00, -2167.04, -1554.50, -1198.34, -815.24, -412.72, 0, 412.72, 815.24, 1198.34, 1554.50, 2167.04, 2974.00, 3505.35, 3424.53, 3283.66, 3162.28, 3065.79, 2989.40, 2928.14, 2878.21, 2836.87];
Fx_5000 = [-4879.09, -4947.88, -5029.26, -5126.68, -5244.73, -5389.09, -5565.14, -5769.16, -5936.04, -5520.29, -4486.02, -3443.27, -2739.01, -1912.14, -984.74, 0, 984.74, 1912.14, 2739.01, 3443.27, 4486.02, 5520.29, 5936.04, 5769.16, 5565.14, 5389.09, 5244.73, 5126.68, 5029.26, 4947.88, 4879.09];
Fx_7000 = [-6895.29, -6986.58, -7094.18, -7222.55, -7377.69, -7567.47, -7801.03, -8083.11, -8376.89, -8263.30, -7354.70, -6103.59, -5076.60, -3695.62, -1962.85, 0, 1962.85, 3695.62, 5076.60, 6103.59, 7354.70, 8263.30, 8376.89, 8083.11, 7801.03, 7567.47, 7377.69, 7222.55, 7094.18, 6986.58, 6895.29];
% LATERAL FORCE DATA (Fy vs slip angle 'alpha')
% Slip angle
alpha_Fy = [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15];
% Fy values
Fy_3000 = [3335.17, 3322.18, 3305.76, 3284.93, 3258.36, 3224.20, 3179.78, 3121.18, 3042.40, 2933.94, 2780.25, 2555.25, 2215.86, 1698.99, 947.39, 0, -947.39, -1698.99, -2215.86, -2555.25, -2780.25, -2933.94, -3042.40, -3121.18, -3179.78, -3224.20, -3258.36, -3284.93, -3305.76, -3322.18, -3335.17];
Fy_5000 = [5321.36, 5318.87, 5312.93, 5302.03, 5283.93, 5255.27, 5210.95, 5143.03, 5038.94, 4878.61, 4629.80, 4241.92, 3641.46, 2742.22, 1497.99, 0, -1497.99, -2742.22, -3641.46, -4241.92, -4629.80, -4878.61, -5038.94, -5143.03, -5210.95, -5255.27, -5283.93, -5302.03, -5312.93, -5318.87, -5321.36];
Fy_7000 = [7009.17, 7015.88, 7020.23, 7020.66, 7014.64, 6998.11, 6964.38, 6902.29, 6792.92, 6604.21, 6282.80, 5745.74, 4884.40, 3607.18, 1925.80, 0, -1925.80, -3607.18, -4884.40, -5745.74, -6282.80, -6604.21, -6792.92, -6902.29, -6964.38, -6998.11, -7014.64, -7020.66, -7020.23, -7015.88, -7009.17];
% ALIGNING TORQUE DATA (Mz vs slip angle 'alpha')
% Slip angle (PDF'te -15'ten 15'e gidiyor)
alpha_Mz = [-15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
% Mz values
Mz_3000 = [7.51, 6.99, 6.37, 5.60, 4.67, 3.51, 2.05, 0.22, -2.10, -5.01, -8.51, -12.24, -14.97, -14.53, -9.21, 0, 9.21, 14.53, 14.97, 12.24, 8.51, 5.01, 2.10, -0.22, -2.05, -3.51, -4.67, -5.60, -6.37, -6.99, -7.51];
Mz_5000 = [21.87, 19.97, 17.67, 14.88, 11.44, 7.19, 1.88, -4.77, -13.06, -23.21, -34.91, -46.47, -53.58, -49.68, -30.52, 0, 30.52, 49.68, 53.58, 46.47, 34.91, 23.21, 13.06, 4.77, -1.88, -7.19, -11.44, -14.88, -17.67, -19.97, -21.87];
Mz_7000 = [37.62, 33.27, 28.05, 21.74, 14.08, 4.68, -6.90, -21.21, -38.76, -59.69, -82.93, -104.40, -115.12, -102.84, -61.45, 0, 61.45, 102.84, 115.12, 104.40, 82.93, 59.69, 38.76, 21.21, 6.90, -4.68, -14.08, -21.74, -28.05, -33.27, -37.62];

% --- 2. Friction Ellipse Analysis --- % 

% Find Peak Forces
Fx_peak_1 = max(Fx_3000); Fy_peak_1 = max(Fy_3000);
Fx_peak_2 = max(Fx_5000); Fy_peak_2 = max(Fy_5000);
Fx_peak_3 = max(Fx_7000); Fy_peak_3 = max(Fy_7000);
% 2. Normalize Forces
mu_x_1 = Fx_peak_1 / Fz1; mu_y_1 = Fy_peak_1 / Fz1;
mu_x_2 = Fx_peak_2 / Fz2; mu_y_2 = Fy_peak_2 / Fz2;
mu_x_3 = Fx_peak_3 / Fz3; mu_y_3 = Fy_peak_3 / Fz3;
% 3. Generate Ellipse Points
theta = linspace(0, 2*pi, 100);                % Angle vector from 0 to 360 degrees
% Ellipses are calculated using the formulas x = a*cos(theta), y = b*sin(theta)
x_ell_1 = mu_x_1 * cos(theta); y_ell_1 = mu_y_1 * sin(theta);
x_ell_2 = mu_x_2 * cos(theta); y_ell_2 = mu_y_2 * sin(theta);
x_ell_3 = mu_x_3 * cos(theta); y_ell_3 = mu_y_3 * sin(theta);
% 4. Plotting
figure('Name', 'Q1: Friction Ellipses', 'Color', 'w');      % window settings
hold on; grid on;
% Drawing ellipses
plot(x_ell_1, y_ell_1, 'b-', 'LineWidth', 2, 'DisplayName', 'Fz1 = 3000 N');
plot(x_ell_2, y_ell_2, 'g-', 'LineWidth', 2, 'DisplayName', 'Fz2 = 5000 N');
plot(x_ell_3, y_ell_3, 'r-', 'LineWidth', 2, 'DisplayName', 'Fz3 = 7000 N');
% Pure slip points marking
% Fz1 Points
plot([mu_x_1, -mu_x_1], [0, 0], 'bo', 'MarkerFaceColor', 'b', 'HandleVisibility', 'off');
plot([0, 0], [mu_y_1, -mu_y_1], 'bo', 'MarkerFaceColor', 'b', 'HandleVisibility', 'off');
% Fz2 Points
plot([mu_x_2, -mu_x_2], [0, 0], 'go', 'MarkerFaceColor', 'g', 'HandleVisibility', 'off');
plot([0, 0], [mu_y_2, -mu_y_2], 'go', 'MarkerFaceColor', 'g', 'HandleVisibility', 'off');
% Fz3 Points
plot([mu_x_3, -mu_x_3], [0, 0], 'ro', 'MarkerFaceColor', 'r', 'HandleVisibility', 'off');
plot([0, 0], [mu_y_3, -mu_y_3], 'ro', 'MarkerFaceColor', 'r', 'HandleVisibility', 'off');
% Graphics Settings
title('Normalized Friction Ellipses for Different Vertical Loads', 'FontWeight', 'bold');
xlabel('Normalized Longitudinal Force (Fx / Fz) [-]', 'FontWeight', 'bold');
ylabel('Normalized Lateral Force (Fy / Fz) [-]', 'FontWeight', 'bold');
legend('Location', 'best');
axis equal;                          % We align the axes to prevent the ellipses from losing their shape.
xlim([-1.5 1.5]); ylim([-1.5 1.5]);

% --- 3. Cornering Stiffness & Pneumatic Trail --- % 

% Cornering Stiffness (Ca) Determination
alpha_lin = [0, 1, 2];               % Data for linear regression (alpha <= 2 degrees)
Fy_lin_1 = [0, 947.39, 1698.99];
Fy_lin_2 = [0, 1497.99, 2742.22];
Fy_lin_3 = [0, 1925.80, 3607.18];
% Linear regression (polyfit) to find the slope (Ca in N/deg)
p1 = polyfit(alpha_lin, Fy_lin_1, 1); Ca1_deg = p1(1);
p2 = polyfit(alpha_lin, Fy_lin_2, 1); Ca2_deg = p2(1);
p3 = polyfit(alpha_lin, Fy_lin_3, 1); Ca3_deg = p3(1);
% Convert Ca from N/deg to N/rad (1 rad = 180/pi deg)
Ca1_rad = Ca1_deg * (180/pi);
Ca2_rad = Ca2_deg * (180/pi);
Ca3_rad = Ca3_deg * (180/pi);
% Printing the calculated angle and radian values ​​to the screen.
fprintf('\n--- Cornering Stiffness (Ca) ---\n');
fprintf('Fz = 3000 N : %.2f N/deg  |  %.2f N/rad\n', Ca1_deg, Ca1_rad);
fprintf('Fz = 5000 N : %.2f N/deg  |  %.2f N/rad\n', Ca2_deg, Ca2_rad);
fprintf('Fz = 7000 N : %.2f N/deg  |  %.2f N/rad\n', Ca3_deg, Ca3_rad);
% Fit Pacejka Exponential Model: Ca = p * Fz * exp(-q * Fz)
Fz_vec = [Fz1, Fz2, Fz3];
Ca_rad_vec = [Ca1_rad, Ca2_rad, Ca3_rad];
y_fit = log(Ca_rad_vec ./ Fz_vec);     % Linearization for curve fitting: log(Ca / Fz) = log(p) - q * Fz
p_fit = polyfit(Fz_vec, y_fit, 1);
q_opt = -p_fit(1);
p_opt = exp(p_fit(2));
% Window settings of Ca vs Fz
figure('Name', 'Q2: Cornering Stiffness vs Vertical Load', 'Color', 'w');
hold on; grid on;
% plotting Ca vs Fz 
plot(Fz_vec, Ca_rad_vec, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'DisplayName', 'Measured Ca');
% Smooth curve for the fit
Fz_plot = linspace(0, 8000, 100);
Ca_fit = p_opt .* Fz_plot .* exp(-q_opt .* Fz_plot);
plot(Fz_plot, Ca_fit, 'b--', 'LineWidth', 2, 'DisplayName', 'Pacejka Fit: p*Fz*exp(-q*Fz)');
% Graphics Settings
title('Cornering Stiffness (Ca) vs. Vertical Load (Fz)', 'FontWeight', 'bold');
xlabel('Vertical Load Fz [N]', 'FontWeight', 'bold');
ylabel('Cornering Stiffness Ca [N/rad]', 'FontWeight', 'bold');
legend('Location', 'best');
xlim([0 8000]); ylim([0 max(Ca_fit)*1.1]);
% Pneumatic Trail (t) Calculation
% Extract positive slip angles to avoid division by zero at alpha = 0
idx_pos = (alpha_Fy > 0); 
alpha_pos = alpha_Fy(idx_pos);
% Calculate pneumatic trail: t = -Mz / Fy
t_1 = -Mz_3000(idx_pos) ./ Fy_3000(idx_pos);
t_2 = -Mz_5000(idx_pos) ./ Fy_5000(idx_pos);
t_3 = -Mz_7000(idx_pos) ./ Fy_7000(idx_pos);
% Window settings of Pneumatic Trail vs Slip Angle
figure('Name', 'Q3: Pneumatic Trail', 'Color', 'w');
hold on; grid on;
% Plot Pneumatic Trail vs Slip Angle
plot(alpha_pos, t_1, 'b-o', 'LineWidth', 1.5, 'DisplayName', 'Fz1 = 3000 N');
plot(alpha_pos, t_2, 'g-o', 'LineWidth', 1.5, 'DisplayName', 'Fz2 = 5000 N');
plot(alpha_pos, t_3, 'r-o', 'LineWidth', 1.5, 'DisplayName', 'Fz3 = 7000 N');
% Plot a zero line to easily spot the zero-crossing
yline(0, 'k--', 'HandleVisibility', 'off');
% Graphics Settings
title('Pneumatic Trail (t) vs. Slip Angle (\alpha)', 'FontWeight', 'bold');
xlabel('Slip Angle \alpha [deg]', 'FontWeight', 'bold');
ylabel('Pneumatic Trail t [m]', 'FontWeight', 'bold');
legend('Location', 'best');

% --- 4. Combined Loading Condition (Friction Ellipse Approximation) --- % 

% Lateral Force at Constant Slip Angle (alpha = 5 deg)
alpha_const = 5;
s_test = [-0.1, 0, 0.1, 0.2];     % given slip rates
% The relevant values ​​are for Fz2 = 5000 N.
Fy_pure_5deg = interp1(alpha_Fy, Fy_5000, alpha_const);    % Fy (alpha=5)
Fx_pure_s = interp1(s_Fx, Fx_5000, s_test);                % Fx's at that moment
Fx_peak_abs = max(abs(Fx_5000));                           % Absolute Fx peak
% Friction ellipse formula combined with Fy calculation
Fy_comb = Fy_pure_5deg .* sqrt(max(0, 1 - (Fx_pure_s ./ Fx_peak_abs).^2));     % The max command prevents the square root from going into the negative.
% Window settings and Plotting
figure('Name', 'Q4a: Combined Slip (Fy vs s)', 'Color', 'w');
plot(s_test, Fy_comb, 'b-o', 'LineWidth', 2, 'MarkerFaceColor', 'b', 'MarkerSize', 6);
grid on;
% Graphics Settings
title('Combined Lateral Force (F_y) vs. Slip Ratio (s) at \alpha = 5^\circ', 'FontWeight', 'bold');
xlabel('Slip Ratio (s) [-]', 'FontWeight', 'bold');
ylabel('Estimated Combined Lateral Force F_{y,comb} [N]', 'FontWeight', 'bold');
ylim([0 5000]); xlim([-0.15 0.25]);
% Longitudinal Force at Constant Slip Ratio (s = 0.1)
s_const = 0.1;
alpha_test = [0, 2, 4, 6];        % given sliding angles
% The relevant values ​​are for Fz2 = 5000 N.
Fx_pure_01 = interp1(s_Fx, Fx_5000, s_const);              % Fx (s=0.1)
Fy_pure_alpha = interp1(alpha_Fy, Fy_5000, alpha_test);    % Fy's at that moment
Fy_peak_abs = max(abs(Fy_5000));                           % Absolute Fy peak
% Fx calculation combined with the friction ellipse formula
Fx_comb = Fx_pure_01 .* sqrt(max(0, 1 - (Fy_pure_alpha ./ Fy_peak_abs).^2));
% Window settings and Plotting
figure('Name', 'Q4b: Combined Slip (Fx vs alpha)', 'Color', 'w');
plot(alpha_test, Fx_comb, 'r-o', 'LineWidth', 2, 'MarkerFaceColor', 'r', 'MarkerSize', 6);
grid on;
% Graphics Settings
title('Combined Longitudinal Force (F_x) vs. Slip Angle (\alpha) at s = 0.1', 'FontWeight', 'bold');
xlabel('Slip Angle \alpha [deg]', 'FontWeight', 'bold');
ylabel('Estimated Combined Longitudinal Force F_{x,comb} [N]', 'FontWeight', 'bold');
ylim([0 6000]); xlim([-1 7]);

% --- 5. Pacejka 'Magic Formula' Parameter Identification --- % 

% Magic Formula Equation (x(1)=B, x(2)=C, x(3)=D, x(4)=E)
MF_eq = @(x, alpha) x(3) .* sin(x(2) .* atan(x(1).*alpha - x(4).*(x(1).*alpha - atan(x(1).*alpha))));
% Optimization Settings
options = optimset('Display', 'off');
lb = [0, 0, 0, -5];                       % (Lower bounds)
ub = [Inf, Inf, Inf, 1];                  % Physical constraint E ≤ 1 during adaptation
% Initial guesses [B, C, D, E]
% D (Peak Factor): This is the peak point of the curve. Therefore, we can consider the highest point of our data as the starting point
% C (Shape Factor): In the literature, this value has been proven to be around 1.3 for lateral forces
% B (Stiffness Factor): The initial slope at the origin is equal to B*C*D.
% And Our gradient was approximately 1500 N/deg so B is approximately 0.2
guess_1 = [0.2, 1.3, max(Fy_3000), 0];
guess_2 = [0.2, 1.3, max(Fy_5000), 0];
guess_3 = [0.2, 1.3, max(Fy_7000), 0];
% Curve Fitting with lsqcurvefit
[par_1, res1] = lsqcurvefit(MF_eq, guess_1, alpha_Fy, Fy_3000, lb, ub, options);
[par_2, res2] = lsqcurvefit(MF_eq, guess_2, alpha_Fy, Fy_5000, lb, ub, options);
[par_3, res3] = lsqcurvefit(MF_eq, guess_3, alpha_Fy, Fy_7000, lb, ub, options);
% Printing the obtained parameters B, C, D, E to the screen
fprintf('\n--- Magic Formula Parameters (B, C, D, E) ---\n');
fprintf('Fz1 (3000 N) -> B=%.4f, C=%.4f, D=%.1f, E=%.4f\n', par_1(1), par_1(2), par_1(3), par_1(4));
fprintf('Fz2 (5000 N) -> B=%.4f, C=%.4f, D=%.1f, E=%.4f\n', par_2(1), par_2(2), par_2(3), par_2(4));
fprintf('Fz3 (7000 N) -> B=%.4f, C=%.4f, D=%.1f, E=%.4f\n', par_3(1), par_3(2), par_3(3), par_3(4));
% RMSE (Root Mean Square Error) and R^2 Calculations
Fy_model_1 = MF_eq(par_1, alpha_Fy);
Fy_model_2 = MF_eq(par_2, alpha_Fy);
Fy_model_3 = MF_eq(par_3, alpha_Fy);
n = length(alpha_Fy);
RMSE_1 = sqrt(sum((Fy_3000 - Fy_model_1).^2)/n);
RMSE_2 = sqrt(sum((Fy_5000 - Fy_model_2).^2)/n);
RMSE_3 = sqrt(sum((Fy_7000 - Fy_model_3).^2)/n);
R2_1 = 1 - sum((Fy_3000 - Fy_model_1).^2) / sum((Fy_3000 - mean(Fy_3000)).^2);
R2_2 = 1 - sum((Fy_5000 - Fy_model_2).^2) / sum((Fy_5000 - mean(Fy_5000)).^2);
R2_3 = 1 - sum((Fy_7000 - Fy_model_3).^2) / sum((Fy_7000 - mean(Fy_7000)).^2);
% Printing the RMSE and R^2
fprintf('\n--- Model Validation (RMSE & R^2) ---\n');
fprintf('Fz1 (3000 N) | RMSE: %6.2f N | R^2: %.4f\n', RMSE_1, R2_1);
fprintf('Fz2 (5000 N) | RMSE: %6.2f N | R^2: %.4f\n', RMSE_2, R2_2);
fprintf('Fz3 (7000 N) | RMSE: %6.2f N | R^2: %.4f\n', RMSE_3, R2_3);
% Window settings and Plotting
alpha_plot = linspace(-16, 16, 200);
figure('Name', 'Q5c: Magic Formula Validation', 'Color', 'w');
hold on; grid on;
% Actual Data Points (Open Circles)
plot(alpha_Fy, Fy_3000, 'bo', 'MarkerFaceColor','w', 'DisplayName', 'Measured Data (3000 N)');
plot(alpha_Fy, Fy_5000, 'go', 'MarkerFaceColor','w', 'DisplayName', 'Measured Data (5000 N)');
plot(alpha_Fy, Fy_7000, 'ro', 'MarkerFaceColor','w', 'DisplayName', 'Measured Data (7000 N)');
% Fitted Magic Formula Solid lines
plot(alpha_plot, MF_eq(par_1, alpha_plot), 'b-', 'LineWidth', 1.5, 'DisplayName', 'Magic Formula (3000 N)');
plot(alpha_plot, MF_eq(par_2, alpha_plot), 'g-', 'LineWidth', 1.5, 'DisplayName', 'Magic Formula (5000 N)');
plot(alpha_plot, MF_eq(par_3, alpha_plot), 'r-', 'LineWidth', 1.5, 'DisplayName', 'Magic Formula (7000 N)');
% Graphic Settings
title('Magic Formula Fit vs. Measured Tire Data', 'FontWeight', 'bold');
xlabel('Slip Angle \alpha [deg]', 'FontWeight', 'bold');
ylabel('Lateral Force F_y [N]', 'FontWeight', 'bold');
legend('Location', 'northwest');
xlim([-16 16]);



