clear all;
close all;
clc


% trot, bound, pacing, gallop, trot run, crawl
res(1) = load('results1.mat');  % This will load tout, Xout, Uout, Xdout, Udout
res(2) = load('results2.mat');
res(3) = load('results3.mat');
res(4) = load('results4.mat');
res(5) = load('results5.mat');
res(6) = load('results6.mat');

res(7) = load('results7.mat');  % 11 kg
res(8) = load('results8.mat');  % 2.75 kg

res(9) = load('results9.mat');  % mu = 0.05
res(10) = load('results10.mat');    % mu = 0.5




%% PLOTS
%Default settings for plots
set(0, 'DefaultTextInterpreter', 'latex')
set(0, 'DefaultLegendInterpreter', 'latex')
set(0, 'DefaultAxesTickLabelInterpreter', 'latex')
lw = 2;

h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$p_{c,x}$ [m]', '$p_{c,y}$ [m]', '$p_{c,z}$ [m]'};
titles  = {'CoM coordinates'};
for k = 1:3
    subplot(3,1,k);
    hold on
     plot(res(9).tout, res(9).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
     plot(res(10).tout, res(10).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(1).tout, res(1).Xout(:,k), 'k:', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k), 'k--', ...
         'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('$0.05$','$0.5$','$1$');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['com_coord.pdf']);


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$\dot{p}_{c,x}$ [m/s]', '$\dot{p}_{c,y}$ [m/s]', '$\dot{p}_{c,z}$ [m/s]'};
titles  = {'Linear Velocities'};
for k = 1:3
    subplot(3,1,k);
    hold on
     plot(res(9).tout, res(9).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
     plot(res(10).tout, res(10).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(1).tout, res(1).Xout(:,k+3), 'k:', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k+3), 'k--', 'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('$0.05$','$0.5$','$1$');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['lin_vel.pdf']);


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$\dot{\varphi}$ [rad/s]', '$\dot{\theta}$ [rad/s]', '$\dot{\psi}$ [rad/s]'};
titles  = {'Angular Velocities'};
for k = 1:3
    subplot(3,1,k);
    hold on
     plot(res(9).tout, res(9).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
     plot(res(10).tout, res(10).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(1).tout, res(1).Xout(:,k+15), 'k:', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k+15), 'k--', ...
         'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('$0.05$','$0.5$','$1$');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['angular_vel.pdf']);

h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
subplot(3,1,1);
plot(res(9).tout, res(9).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(9).tout, res(9).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(9).tout, res(9).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(9).tout, res(9).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
ylabel('$f_{gr,0.05}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%title('Ground reaction forces')
subplot(3,1,2);
plot(res(10).tout, res(10).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(10).tout, res(10).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(10).tout, res(10).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(10).tout, res(10).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
ylabel('$f_{gr,0.5}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
subplot(3,1,3);
plot(res(1).tout, res(1).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(1).tout, res(1).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(1).tout, res(1).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(1).tout, res(1).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
xlabel('$t$ [s]')
ylabel('$f_{gr,1}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%exportgraphics(h, 'fgr.pdf');




h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$p_{c,x}$ [m]', '$p_{c,y}$ [m]', '$p_{c,z}$ [m]'};
titles  = {'CoM coordinates'};
for k = 1:3
    subplot(3,1,k);
    hold on
     plot(res(8).tout, res(8).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
     plot(res(1).tout, res(1).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(7).tout, res(7).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k), 'k--', ...
         'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('$2.75$','$5.5$','$11$');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['com_coord.pdf']);


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$\dot{p}_{c,x}$ [m/s]', '$\dot{p}_{c,y}$ [m/s]', '$\dot{p}_{c,z}$ [m/s]'};
titles  = {'Linear Velocities'};
for k = 1:3
    subplot(3,1,k);
    hold on
     plot(res(8).tout, res(8).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
     plot(res(1).tout, res(1).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(7).tout, res(7).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k+3), 'k--', 'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('$2.75$','$5.5$','$11$');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['lin_vel.pdf']);


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$\dot{\varphi}$ [rad/s]', '$\dot{\theta}$ [rad/s]', '$\dot{\psi}$ [rad/s]'};
titles  = {'Angular Velocities'};
for k = 1:3
    subplot(3,1,k);
    hold on
     plot(res(8).tout, res(8).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
     plot(res(1).tout, res(1).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(7).tout, res(7).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k+15), 'k--', ...
         'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('$2.75$','$5.5$','$11$');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['angular_vel.pdf']);

h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
subplot(3,1,1);
plot(res(8).tout, res(8).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(8).tout, res(8).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(8).tout, res(8).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(8).tout, res(8).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
ylabel('$f_{gr,2.75}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%title('Ground reaction forces')
subplot(3,1,2);
plot(res(1).tout, res(1).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(1).tout, res(1).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(1).tout, res(1).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(1).tout, res(1).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
ylabel('$f_{gr,5.5}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
subplot(3,1,3);
plot(res(7).tout, res(7).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(7).tout, res(7).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(7).tout, res(7).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(7).tout, res(7).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
xlabel('$t$ [s]')
ylabel('$f_{gr,11}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%exportgraphics(h, 'fgr.pdf');


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$p_{c,x}$ [m]', '$p_{c,y}$ [m]', '$p_{c,z}$ [m]'};
titles  = {'CoM coordinates'};
for k = 1:3
    subplot(3,1,k);
    %plot(res(1).tout, res(1).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
    hold on
     plot(res(2).tout, res(2).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
     plot(res(3).tout, res(3).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(4).tout, res(4).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
     %plot(res(5).tout, res(5).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', 'b');
     %plot(res(6).tout, res(6).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k), 'k--', ...
         'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('Bound','Pacing','Gallop');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['com_coord.pdf']);


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$\dot{p}_{c,x}$ [m/s]', '$\dot{p}_{c,y}$ [m/s]', '$\dot{p}_{c,z}$ [m/s]'};
titles  = {'Linear Velocities'};
for k = 1:3
    subplot(3,1,k);
    %plot(res(1).tout, res(1).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
    hold on
     plot(res(2).tout, res(2).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
     plot(res(3).tout, res(3).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(4).tout, res(4).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
     %plot(res(5).tout, res(5).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', 'b');
     %plot(res(6).tout, res(6).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k+3), 'k--', 'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('Bound','Pacing','Gallop');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['lin_vel.pdf']);


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$\dot{\varphi}$ [rad/s]', '$\dot{\theta}$ [rad/s]', '$\dot{\psi}$ [rad/s]'};
titles  = {'Angular Velocities'};
for k = 1:3
    subplot(3,1,k);
    %plot(res(1).tout, res(1).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
    hold on
     plot(res(2).tout, res(2).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
     plot(res(3).tout, res(3).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(4).tout, res(4).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    %plot(res(5).tout, res(5).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', 'b');
     %plot(res(6).tout, res(6).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k+15), 'k--', ...
         'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('Bound','Pacing','Gallop');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['angular_vel.pdf']);

h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
subplot(3,1,1);
plot(res(2).tout, res(2).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(2).tout, res(2).Uout(:,6), 'k:', 'Linewidth', lw ,'Color', 'r');
plot(res(2).tout, res(2).Uout(:,9), 'k-', 'Linewidth', lw ,'Color', 'b');
plot(res(2).tout, res(2).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
ylabel('$f_{gr,bound}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%title('Ground reaction forces')
subplot(3,1,2);
plot(res(3).tout, res(3).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(3).tout, res(3).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(3).tout, res(3).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(3).tout, res(3).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
ylabel('$f_{gr,pacing}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
subplot(3,1,3);
plot(res(4).tout, res(4).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(4).tout, res(4).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(4).tout, res(4).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(4).tout, res(4).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
xlabel('$t$ [s]')
ylabel('$f_{gr,gallop}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%exportgraphics(h, 'fgr.pdf');


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$p_{c,x}$ [m]', '$p_{c,y}$ [m]', '$p_{c,z}$ [m]'};
titles  = {'CoM coordinates'};
for k = 1:3
    subplot(3,1,k);
    plot(res(1).tout, res(1).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
    hold on
    % plot(res(2).tout, res(2).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', 'b');
    % plot(res(3).tout, res(3).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    % plot(res(4).tout, res(4).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', 'g');
     plot(res(5).tout, res(5).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(6).tout, res(6).Xout(:,k), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k), 'k--', ...
         'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('Trot','Run','Crawl');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['com_coord.pdf']);


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$\dot{p}_{c,x}$ [m/s]', '$\dot{p}_{c,y}$ [m/s]', '$\dot{p}_{c,z}$ [m/s]'};
titles  = {'Linear Velocities'};
for k = 1:3
    subplot(3,1,k);
    plot(res(1).tout, res(1).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
    hold on
    % plot(res(2).tout, res(2).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', 'b');
    % plot(res(3).tout, res(3).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    % plot(res(4).tout, res(4).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', 'g');
     plot(res(5).tout, res(5).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(6).tout, res(6).Xout(:,k+3), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k+3), 'k--', 'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('Trot','Run','Crawl');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['lin_vel.pdf']);


h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
ylabels = {'$\dot{\varphi}$ [rad/s]', '$\dot{\theta}$ [rad/s]', '$\dot{\psi}$ [rad/s]'};
titles  = {'Angular Velocities'};
for k = 1:3
    subplot(3,1,k);
    plot(res(1).tout, res(1).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.2, 0.2, 0.2]);
    hold on
    % plot(res(2).tout, res(2).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', 'b');
    % plot(res(3).tout, res(3).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    % plot(res(4).tout, res(4).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', 'g');
     plot(res(5).tout, res(5).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', 'b');
     plot(res(6).tout, res(6).Xout(:,k+15), 'k-', 'LineWidth', lw, 'Color', [0.8, 0.0, 0.8]);
    plot(res(1).tout, res(1).Xdout(:,k+15), 'k--', ...
         'LineWidth', lw, 'Color', 'r');
    ylabel(ylabels{k}, 'Interpreter', 'latex');
    if k == 3
        xlabel('$t$ [s]', 'Interpreter', 'latex');
    end
    if k == 1
        %title(titles{k}, 'Interpreter', 'latex');
    end
    legend('Trot','Run','Crawl');
    legend('Location','best','Orientation','horizontal','AutoUpdate','off')
    set(gca, 'FontSize', 22);
    grid on;
    box on;
    axis padded;
    xlim([res(1).tout(1), res(1).tout(end)]);
end
set(gcf, 'Color', 'w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
%exportgraphics(h, ['angular_vel.pdf']);

h = figure('Renderer', 'painters', 'Position', [10 10 900 800]);
subplot(3,1,1);
plot(res(1).tout, res(1).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(1).tout, res(1).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(1).tout, res(1).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(1).tout, res(1).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
ylabel('$f_{gr,trot}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%title('Ground reaction forces')
subplot(3,1,2);
plot(res(5).tout, res(5).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(5).tout, res(5).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(5).tout, res(5).Uout(:,9), 'k:.', 'Linewidth', lw ,'Color', 'b');
plot(res(5).tout, res(5).Uout(:,12), 'k:.', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
ylabel('$f_{gr,run}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
subplot(3,1,3);
plot(res(6).tout, res(6).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
hold on
plot(res(6).tout, res(6).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
plot(res(6).tout, res(6).Uout(:,9), 'k:', 'Linewidth', lw ,'Color', 'b');
plot(res(6).tout, res(6).Uout(:,12), 'k:', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
legend('LF','RF','LH','RH');
xlabel('$t$ [s]')
ylabel('$f_{gr,crawl}$ [N]')
set(gca, 'FontSize',22);
grid on
box on
legend('Location','best','Orientation','horizontal','AutoUpdate','off')
set(gcf,'color','w');
set(h, 'MenuBar', 'none');
set(h, 'ToolBar', 'none');
axis padded
xlim([res(1).tout(1), res(1).tout(end)]);
%set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
%annotation('rectangle',[0 0 1 1],'Color','w');
%exportgraphics(h, 'fgr.pdf');

% h = figure('Renderer', 'painters', 'Position', [10 10 900 600]);
% subplot(2,1,1);
% plot(res(1).tout, res(1).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
% hold on
% plot(res(1).tout, res(1).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
% legend('LF','RF');
% ylabel('$f_{gr}$ [N]')
% set(gca, 'FontSize',22);
% grid on
% box on
% legend('Location','best','Orientation','horizontal','AutoUpdate','off')
% set(gcf,'color','w');
% set(h, 'MenuBar', 'none');
% set(h, 'ToolBar', 'none');
% axis padded
% xlim([res(1).tout(1), res(1).tout(end)]);
% %set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
% annotation('rectangle',[0 0 1 1],'Color','w');
% %title('Ground reaction forces')
% subplot(2,1,2);
% plot(res(1).tout, res(1).Uout(:,9), 'k-', 'Linewidth', lw ,'Color', 'b');
% hold on
% plot(res(1).tout, res(1).Uout(:,12), 'k-', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
% legend('LH','RH');
% xlabel('$t$ [s]')
% ylabel('$f_{gr}$ [N]')
% set(gca, 'FontSize',22);
% grid on
% box on
% legend('Location','best','Orientation','horizontal','AutoUpdate','off')
% set(gcf,'color','w');
% set(h, 'MenuBar', 'none');
% set(h, 'ToolBar', 'none');
% axis padded
% xlim([res(1).tout(1), res(1).tout(end)]);
% %set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
% annotation('rectangle',[0 0 1 1],'Color','w');
% %exportgraphics(h, 'fgr.pdf');


% h = figure('Renderer', 'painters', 'Position', [10 10 900 350]);
% plot(res(1).tout, res(1).Uout(:,3), 'k-', 'Linewidth', lw ,'Color', [0.2, 0.2, 0.2]);
% hold on
% plot(res(1).tout, res(1).Uout(:,6), 'k-', 'Linewidth', lw ,'Color', 'r');
% plot(res(1).tout, res(1).Uout(:,9), 'k--', 'Linewidth', lw ,'Color', 'b');
% plot(res(1).tout, res(1).Uout(:,12), 'k--', 'Linewidth', lw ,'Color', [0.8, 0.0, 0.8]);
% xlabel('$t$ [s]')
% ylabel('$f_{gr}$ [N]')
% set(gca, 'FontSize',22);
% grid on
% box on
% legend('LF','RF','LH','RH');
% legend('Location','best','Orientation','horizontal','AutoUpdate','off')
% set(gcf,'color','w');
% set(h, 'MenuBar', 'none');
% set(h, 'ToolBar', 'none');
% %axis equal
% axis padded
% xlim([res(1).tout(1), res(1).tout(end)]);
% %set(gca, 'InnerPosition', [0.1400 0.32 0.82 0.55])
% annotation('rectangle',[0 0 1 1],'Color','w');
% title('Ground reaction forces')
% %exportgraphics(h, 'fgr.pdf');




% h = figure('Renderer', 'painters', 'Position', [10 10 1000 800]);
% 
% % Indices of the control components to plot
% indices = [3, 6, 9, 12];
% 
% % Labels and titles
% ylabels = {'$u_3$', '$u_6$', '$u_9$', '$u_{12}$'};
% titles  = {'Control Inputs $u_3$ to $u_{12}$'};  % Optional, used on first plot
% 
% % Subplot positions for 2x2 grid
% positions = [1, 2, 3, 4];
% 
% for k = 1:4
%     subplot(2,2,positions(k));
% 
%     % Plot Uout from two simulations
%     plot(res(1).tout, res(1).Uout(:,indices(k)), 'Color', [0.2, 0.2, 0.2], 'LineWidth', lw); hold on;
%     plot(res(2).tout, res(2).Uout(:,indices(k)), 'b', 'LineWidth', lw);
% 
%     % Plot Udout (reference)
%     %plot(res(1).tout, res(1).Udout(:,indices(k)), 'r--', 'LineWidth', lw);
% 
%     ylabel(ylabels{k}, 'Interpreter', 'latex');
% 
%     if k > 2
%         xlabel('$t$ [s]', 'Interpreter', 'latex');
%     end
% 
%     if k == 1
%         title(titles{1}, 'Interpreter', 'latex');
%         legend('$k_3>k_2$', 'Control', 'Reference', 'Location', 'best', ...
%                'Orientation', 'horizontal', 'AutoUpdate', 'off', ...
%                'Interpreter', 'latex');
%     end
% 
%     set(gca, 'FontSize', 22);
%     grid on;
%     box on;
%     axis padded;
%     xlim([res(1).tout(1), res(1).tout(end)]);
% end
% 
% set(gcf, 'Color', 'w');
% set(h, 'MenuBar', 'none');
% set(h, 'ToolBar', 'none');
% %exportgraphics(h, ['control_inputs_grid.pdf']);
% 
% 
% 
% h = figure('Renderer', 'painters', 'Position', [10 10 1000 800]);
% 
% % Indices to plot
% indices = [3, 6, 9, 12];
% colors = lines(4);  % Distinct colors for each component
% lw = 2;  % Line width (adjust as needed)
% 
% % Labels for legend
% labels = {'$u_3$', '$u_6$', '$u_9$', '$u_{12}$'};
% 
% % --- Top subplot: res(1)
% subplot(2,1,1);
% hold on;
% for i = 1:length(indices)
%     plot(res(1).tout, res(1).Uout(:,indices(i)), 'LineWidth', lw, ...
%          'Color', colors(i,:));
% end
% title('Control Inputs from res(1)', 'Interpreter', 'latex');
% ylabel('$u_i$', 'Interpreter', 'latex');
% legend(labels, 'Interpreter', 'latex', 'Location', 'best', 'Orientation', 'horizontal');
% grid on;
% box on;
% axis padded;
% xlim([res(1).tout(1), res(1).tout(end)]);
% set(gca, 'FontSize', 22);
% 
% % --- Bottom subplot: res(2)
% subplot(2,1,2);
% hold on;
% for i = 1:length(indices)
%     plot(res(2).tout, res(2).Uout(:,indices(i)), 'LineWidth', lw, ...
%          'Color', colors(i,:));
% end
% title('Control Inputs from res(2)', 'Interpreter', 'latex');
% xlabel('$t$ [s]', 'Interpreter', 'latex');
% ylabel('$u_i$', 'Interpreter', 'latex');
% legend(labels, 'Interpreter', 'latex', 'Location', 'best', 'Orientation', 'horizontal');
% grid on;
% box on;
% axis padded;
% xlim([res(2).tout(1), res(2).tout(end)]);
% set(gca, 'FontSize', 22);
% 
% set(gcf, 'Color', 'w');
% set(h, 'MenuBar', 'none');
% set(h, 'ToolBar', 'none');
% %exportgraphics(h, ['Uout_comparison.pdf']);
