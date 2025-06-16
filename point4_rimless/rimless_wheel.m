clc
%close all
clear all

res = struct();

% Parameters
g = 9.81;          % gravity (m/s^2)
%l = 1.0;           % leg length (m) %%MODIFY HERE%% 
l = 1;
alpha = pi/8;      % half inter-leg angle (rad) %%MODIFY HERE%% 
gamma = 0.08;      % slope angle (rad) %%MODIFY HERE%% 

% Initial conditions
% thetadot0 = 0.95;%%MODIFY HERE%% 
%thetadot0 = 0.975416874393112;
omega1 = sqrt(2*g/l*(1-cos(gamma-alpha)));
omega2 = -sqrt(2*g/l*(1-cos(gamma+alpha)));

thetadot0_value = [-3 -1.42 0.95 3];

for i=1:4

    thetadot0 = thetadot0_value(i);
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
    res(i).T = T;
    res(i).Y = Y;
end

%% PLOTS
%Default settings for plots
set(0, 'DefaultTextInterpreter', 'latex')
set(0, 'DefaultLegendInterpreter', 'latex')
set(0, 'DefaultAxesTickLabelInterpreter', 'latex')
lw = 2;

h = figure('Renderer', 'painters', 'Position', [10 10 900 450]);
ylabels = {'$\theta$ [rad]', '$\dot{\theta}$ [rad/s]'};
titles  = {'Rimless Wheel Dynamics'};
for k = 1:2
    subplot(2,1,k);
    
    hold on
    
    
    ylabel(ylabels{1}, 'Interpreter', 'latex');
    if k == 2
        plot(res(2).T, res(2).Y(:,1), 'k-', 'LineWidth', lw, 'Color', 'r');
        plot(res(4).T, res(4).Y(:,1), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
        xlabel('$t$ [s]', 'Interpreter', 'latex');
        plot([T(1) T(end)], [gamma-alpha gamma-alpha], 'k--', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
        plot([T(1) T(end)], [gamma+alpha gamma+alpha], 'k--', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
        legend('$\dot{\theta}_0=-1.42$','$\dot{\theta}_0=3$');
    end
    if k == 1
        plot(res(1).T, res(1).Y(:,1), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
        plot(res(3).T, res(3).Y(:,1), 'k-', 'LineWidth', lw, 'Color', 'b');
        %title(titles{k}, 'Interpreter', 'latex');
        plot([T(1) T(end)], [gamma-alpha gamma-alpha], 'k--', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
        plot([T(1) T(end)], [gamma+alpha gamma+alpha], 'k--', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
        legend('$\dot{\theta}_0=-3$','$\dot{\theta}_0=0.95$');
    end
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([T(1), T(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['1theta.pdf']);


h = figure('Renderer', 'painters', 'Position', [10 10 900 250]);
plot(res(1).T, res(1).Y(:,k), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
hold on
plot(res(2).T, res(2).Y(:,k), 'k-', 'LineWidth', lw, 'Color', 'r');
plot(res(3).T, res(3).Y(:,k), 'k-', 'LineWidth', lw, 'Color', 'b');
plot(res(4).T, res(4).Y(:,k), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
plot([T(1) T(end)], [omega1 omega1], 'k--', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
plot([T(1) T(end)], [omega2 omega2], 'k--', 'LineWidth',lw,'Color', [0.5, 0.5, 0.5]);
legend('-3','-1.42','0.95','3');
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
xlabel('$t$ [s]')
ylabel('$\dot{\theta}$ [rad/s]')
set(gca, 'FontSize',22);
grid on
box on
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([T(1), T(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%exportgraphics(h, '1thetadot.pdf');




h = figure('Renderer', 'painters', 'Position', [10 10 900 400]);

% --- Left subplot: res(1) and res(2)
subplot(1,2,1)
plot(res(1).Y(:,1), res(1).Y(:,2), 'k-', 'Linewidth', lw, 'Color', [0.8, 0.0, 0.8]);
hold on
plot(res(3).Y(:,1), res(3).Y(:,2), 'k-', 'Linewidth', lw, 'Color', 'b');
plot([gamma-alpha gamma-alpha], [-3 3.1], 'k--', 'Linewidth', lw, 'Color', [0.5, 0.5, 0.5]);
plot([gamma+alpha gamma+alpha], [-3 3.1], 'k--', 'Linewidth', lw, 'Color', [0.5, 0.5, 0.5]);
plot(res(1).Y(1,1), res(1).Y(1,2), 'Color', [0.8, 0.0, 0.8], 'Marker','*','LineWidth',5)
plot(res(3).Y(1,1), res(3).Y(1,2), 'Color', 'b', 'Marker','*','LineWidth',5)
xlabel('$\theta$ [rad]')
ylabel('$\dot{\theta}$ [rad/s]')
%title('Case -3 and -1.42')
set(gca, 'FontSize', 22);
grid on
box on
axis padded
legend('-3','0.95');
legend('Location','best','Orientation','horizontal','AutoUpdate','off')

% --- Right subplot: res(3) and res(4)
subplot(1,2,2)
plot(res(2).Y(:,1), res(2).Y(:,2), 'k-', 'Linewidth', lw, 'Color', 'r');
hold on
plot(res(4).Y(:,1), res(4).Y(:,2), 'k-', 'Linewidth', lw, 'Color', [0.2, 0.2, 0.2]);
plot([gamma-alpha gamma-alpha], [-3 3.1], 'k--', 'Linewidth', lw, 'Color', [0.5, 0.5, 0.5]);
plot([gamma+alpha gamma+alpha], [-3 3.1], 'k--', 'Linewidth', lw, 'Color', [0.5, 0.5, 0.5]);
plot(res(2).Y(1,1), res(2).Y(1,2), 'Color', 'r', 'Marker','*','LineWidth',5)
plot(res(4).Y(1,1), res(4).Y(1,2), 'Color', [0.2, 0.2, 0.2], 'Marker','*','LineWidth',5)
xlabel('$\theta$ [rad]')
%ylabel('$\dot{\theta}$ [rad/s]')
%title('Case 0.95 and 3')
set(gca, 'FontSize', 22);
grid on
box on
axis padded
legend('-1.42','3');
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf, 'color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, '1phasebetter.pdf');



% % Plot results
% figure(1)
% plot(T, Y(:,1), 'b', 'DisplayName', '\theta (rad)');
% hold on;
% plot(T, Y(:,2), 'r', 'DisplayName', '\theta dot (rad/s)');
% xlabel('Time (s)');
% ylabel('State');
% title('Rimless Wheel Dynamics');
% legend show;
% grid on;
% 
% figure(2)
% plot(Y(:,1), Y(:,2), 'b', 'DisplayName', '\theta (rad)');
% hold on
% plot(Y(1,1), Y(1,2), 'r', 'Marker','*','LineWidth',5,'DisplayName','Initial point');
% xlabel('\theta (rad)');
% ylabel('\theta dot (rad/s)');
% title('Rimless Wheel Limit Cycle');
% legend show;
% grid on;

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