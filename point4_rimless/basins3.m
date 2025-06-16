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
l = 1.0;           % leg length (m) %%MODIFY HERE%% 
%alpha = pi/8;      % half inter-leg angle (rad) %%MODIFY HERE%% 
gamma = 0.08;      % slope angle (rad) %%MODIFY HERE%% 



% Initial conditions
thetadot0 = 0.95;%%MODIFY HERE%% 


num_initial_conditions = 400;
alpha_min = gamma; 
alpha_max = pi/2; 
alpha_range = linspace(alpha_min, alpha_max, num_initial_conditions);

omega1_range = sqrt(2*g/l*(1-cos(gamma-alpha_range)));

h = figure('Renderer', 'painters', 'Position', [10 10 900 250]);
plot(alpha_range, omega1_range, 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2], 'HandleVisibility', 'off');
hold on;
plot([0 alpha_range(end)], [0.95 0.95], 'k--', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
plot([gamma gamma], [0 4], 'k--', 'LineWidth',lw,'Color', 'r');
legend('$\dot{\theta}_0$', '$\gamma$');
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
xlabel('$\alpha$ [rad]')
ylabel('$\omega_1$ [rad/s]')
set(gca, 'FontSize',22);
grid on
box on
set(gcf,'color','w');
%set(h, 'MenuBar', 'none');
%set(h, 'ToolBar', 'none');
%axis equal
axis padded
xticks(0:0.2:alpha_range(end));  % More ticks
xlim([0 alpha_range(end)])
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%title('Heading Velocity profile unscaled')
%exportgraphics(h, '3omega1_alpha.pdf');



function dydt = dynamics(~, y, g, l, ds)
    theta = y(1);
    thetadot = y(2);
    if (~ds)
        dtheta = thetadot;
        dthetadot = (g/l) * sin(theta);
    else
        dtheta = 0;
        dthetadot = 0;
    end
    dydt = [dtheta; dthetadot];
end

function [value, isterminal, direction] = impact_event(~, y, alpha,gamma)
    
    value = [y(1)-alpha-gamma; y(1)-gamma+alpha];% Trigger when theta = gamma+alpha
                                     %Trigger when theta = gamma-alpha
    isterminal = [1;1];         % Stop the integration
    direction = [1;-1];          % Detect only when increasing
end

function [yplus,ds] = impact_map(y_minus, alpha,g,l)%minus: before impact time; plus: after impact time
    if (y_minus(2)>=0)
        theta_plus = y_minus(1)-2*alpha;
    else
        theta_plus = y_minus(1)+2*alpha;
    end
    thetadot_plus = cos(2*alpha) * y_minus(2);
    if (thetadot_plus < 0.01*sqrt(g/l) && thetadot_plus >-0.01*sqrt(g/l)) 
        thetadot_plus = 0;
        ds = 1;
    else
        ds = 0;
    end
    yplus = [theta_plus; thetadot_plus];
end