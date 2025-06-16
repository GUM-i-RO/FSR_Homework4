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
alpha = pi/8;      % half inter-leg angle (rad) %%MODIFY HERE%% 
gamma = 0.08;      % slope angle (rad) %%MODIFY HERE%% 

omega1 = sqrt(2*g/l*(1-cos(gamma-alpha)));
omega2 = -sqrt(2*g/l*(1-cos(gamma+alpha)));

% Initial conditions
% thetadot0 = 0.95;%%MODIFY HERE%% 
%thetadot0 = 0.975416874393112;
%thetadot0 = sqrt(2*g/l*(1-cos(gamma-alpha)));

% --- Basins of Attraction Plotting Settings ---
num_initial_conditions = 400; % Number of initial thetadot0 values to test
thetadot0_min = -30; % Minimum initial angular velocity to test 
thetadot0_max = 10; % Maximum initial angular velocity to test 
thetadot0_range = linspace(thetadot0_min, thetadot0_max, num_initial_conditions);

% --- Storage for results ---
hei = cell(num_initial_conditions, 1);
colors = cell(num_initial_conditions, 1); % To color-code different behaviors

h = figure('Renderer', 'painters', 'Position', [10 10 900 120]);
hold on;

% --- Loop through different initial conditions ---
for i = 1:num_initial_conditions
    thetadot0 = thetadot0_range(i);

    if (thetadot0 >= 0)
        theta0 = gamma-alpha;
    else
        theta0 = gamma+alpha;
    end
    
    double_support = 0;
    
    y0 = [theta0; thetadot0];
    
    % Simulation settings
    t0 = 0; %initial time
    tf = 25; %final time
    dt = 0.01; %max step time
    
    % Time/state storage
    T = [];
    Y = [];
    
    while t0 < tf
        options = odeset('Events', @(t, y) impact_event(t, y, alpha,gamma), 'MaxStep', dt);
        [t, y, te, ye, ie] = ode45(@(t, y) dynamics(t, y, g, l, double_support), [t0 tf], y0, options);
        
        T = [T; t];
        Y = [Y; y];
    
        if ~isempty(te)
            [y0,double_support] = impact_map(ye, alpha,g,l); % apply impact map
            t0 = te;
        else
            break;
        end
    end

    if Y(end,2) == 0
        colors{i} = 'r.'; % Red for stopping
        hei{i} = 0;
    else
        colors{i} = 'b.'; % Blue for walking (limit cycle)
        hei{i} = 0.02;
    end

    plot(thetadot0, hei{i}, colors{i}, 'MarkerSize', 10, 'HandleVisibility','off'); % Plot final point
end
% legend('b=0.01','b=0.1','b=0.5','b=1');
% legend('Location','best','Orientation','horizontal','AutoUpdate','off')
xlabel('$\dot{\theta}_0$ [rad/s]')
set(gca, 'FontSize',22);
grid on
box on
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
yticks([0 0.02])
%yticklabels({'Fixed Point','Limit Cycle'})
ylim([0, 0.02])  % tight band around zero
set(gca, 'YTick', []);
set(gca, 'YColor', 'none');
xticks(-30:5:10);  % More ticks
xlim([-30, 10])
plot([omega1 omega1], [0, 0.02], 'k-', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
plot([omega2 omega2], [0, 0.02], 'k-', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
%exportgraphics(h, 'basins.pdf');


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