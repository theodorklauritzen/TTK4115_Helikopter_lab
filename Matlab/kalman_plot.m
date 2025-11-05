clc; clear;

load('labday4/kalman.mat');

p = kalman_data(:, 1);
p_dot = kalman_data(:, 2);
e = kalman_data(:, 3);
e_dot = kalman_data(:, 4);
lambda_dot = kalman_data(:, 5);
p_f = kalman_data(:, 6);
p_dot_f = kalman_data(:, 7);
e_f = kalman_data(:, 8);
e_dot_f = kalman_data(:, 9);
lambda_f = kalman_data(:, 10);
lambda_dot_f = kalman_data(:, 11);
time = kalman_data(:, 12);

fig1 = figure('visible', 'off');

hold off;
plot(time, p, 'linewidth', 1.5);
hold on;
plot(time, p_f, 'linewidth', 1.5);
legend("Pitch meassured", "Pitch filtered");
title("Kalman filter Pitch");
xlabel("Time [s]");
ylabel("Angle [rad]")
grid on;

hgexport(fig1, 'labday4Plots/p.eps');

hold off;
plot(time, p_dot, 'linewidth', 1.5);
hold on;
plot(time, p_dot_f, 'linewidth', 1.5);
legend("Pitch rate meassured", "Pitch rate filtered");
title("Kalman filter Pitch rate");
xlabel("Time [s]");
ylabel("Angle rate [rad/s]")
grid on;

hgexport(fig1, 'labday4Plots/p_dot.eps');

hold off;
plot(time, e, 'linewidth', 1.5);
hold on;
plot(time, e_f, 'linewidth', 1.5);
legend("Elevation meassured", "Elevation filtered");
title("Kalman filter Elevation");
xlabel("Time [s]");
ylabel("Angle [rad]")
grid on;

hgexport(fig1, 'labday4Plots/e.eps');

hold off;
plot(time, e_dot, 'linewidth', 1.5);
hold on;
plot(time, e_dot_f, 'linewidth', 1.5);
legend("Elevation rate meassured", "Elevation rate filtered");
title("Kalman filter Elevation rate");
xlabel("Time [s]");
ylabel("Angle rate [rad/s]")
grid on;

hgexport(fig1, 'labday4Plots/e_dot.eps');

hold off;
plot(time, lambda_dot, 'linewidth', 1.5);
hold on;
plot(time, lambda_dot_f, 'linewidth', 1.5);
legend("Lambda rate meassured", "Lambda rate filtered");
title("Kalman filter Lambda rate");
xlabel("Time [s]");
ylabel("Angle rate [rad/s]")
grid on;

hgexport(fig1, 'labday4Plots/lambda_dot.eps');
