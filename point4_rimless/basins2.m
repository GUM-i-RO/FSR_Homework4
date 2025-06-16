clc
%close all
clear all

%Default settings for plots
set(0, 'DefaultTextInterpreter', 'latex')
set(0, 'DefaultLegendInterpreter', 'latex')
set(0, 'DefaultAxesTickLabelInterpreter', 'latex')
lw = 2;

% Parameters
g = 9.81;          % gravity (m/s^2)
%l = 1.0;           % leg length (m) %%MODIFY HERE%% 
alpha = pi/8;      % half inter-leg angle (rad) %%MODIFY HERE%% 
gamma = 0.08;      % slope angle (rad) %%MODIFY HERE%% 



% Initial conditions
thetadot0 = 0.95;%%MODIFY HERE%% 



num_initial_conditions = 400; 
l_min = 0.1; 
l_max = 4; 
l_range = linspace(l_min, l_max, num_initial_conditions);

omega1_range = sqrt(2*g./l_range*(1-cos(gamma-alpha)));

h = figure('Renderer', 'painters', 'Position', [10 10 900 250]);
plot(l_range, omega1_range, 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2], 'HandleVisibility', 'off');
hold on;
plot([0 l_range(end)], [0.95 0.95], 'k--', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
legend('$\dot{\theta}_0$');
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
xlabel('$l$ [m]')
ylabel('$\omega_1$ [rad/s]')
set(gca, 'FontSize',22);
grid on
box on
set(gcf,'color','w');
%set(h, 'MenuBar', 'none');
%set(h, 'ToolBar', 'none');
%axis equal
axis padded
xticks(0:1:l_range(end));  % More ticks
xlim([0 l_range(end)])
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%title('Heading Velocity profile unscaled')
%exportgraphics(h, '2omega1_l.pdf');



