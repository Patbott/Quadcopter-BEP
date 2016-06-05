close all

%% North position
figure();
h1 = subplot(3,1,1);
plot(pn_kf);
grid;
axis([22 27 0.25 1]);
l = legend('Sensor','Real','Kalman','Location','southeast');
set(l,'Interpreter','latex','FontSize',7);
xlabel('');
ylabel('');
title('');
ax = gca;
ax.TickLabelInterpreter = 'latex';

subplot(3,1,2);
plot(pn_ekf);
grid;
axis([22 27 0.25 1]);
l = legend('Sensor','Real','EKF','Location','southeast');
set(l,'Interpreter','latex','FontSize',7);
xlabel('');
ylabel('');
title('');
ax = gca;
ax.TickLabelInterpreter = 'latex';

h2 = subplot(3,1,3);
plot(pn_ekfui);
grid;
axis([22 27 0.25 1]);
l = legend('Sensor','Real','EKF-UI','Location','southeast');
set(l,'Interpreter','latex','FontSize',7);
ylabel('');
xlabel('Time $t$ (seconds)','Interpreter', 'latex','FontSize',9)
title('');
ax = gca;
ax.TickLabelInterpreter = 'latex';

p1=get(h1,'position');
p2=get(h2,'position');
height=p1(2)+p1(4)-p2(2);
axes('position',[p2(1) p2(2) p2(3) height],'visible','off');
ylabel('North-position $p_n$ (meter)','Interpreter', 'latex','visible','on','FontSize',9);

% Error
figure();
hold on;
plot(pn_kf.Time,(pn_kf.Data(:,2)-pn_kf.Data(:,3)).^2);
plot(pn_ekf.Time,(pn_ekf.Data(:,2)-pn_ekf.Data(:,3)).^2);
plot(pn_ekfui.Time,(pn_ekfui.Data(:,2)-pn_ekfui.Data(:,3)).^2);
axis([0 50 0 1e-3]);
l = legend('KF','EKF','EKF-UI');
set(l,'Interpreter','latex','FontSize',7);
grid;
ylabel('Squared error of $p_n$','Interpreter', 'latex','FontSize',9);
xlabel('Time $t$ (seconds)','Interpreter', 'latex','FontSize',9);
ax = gca;
ax.TickLabelInterpreter = 'latex';
%% P angular velocity
figure();
h1 = subplot(3,1,1);
plot(p_kf);
grid;
axis([22 27 -0.25 0.25]);
l = legend('Sensor','Real','Kalman','Location','northeast');
set(l,'Interpreter','latex','FontSize',7);
xlabel('');
ylabel('');
title('');
ax = gca;
ax.TickLabelInterpreter = 'latex';

subplot(3,1,2);
plot(p_ekf);
grid;
axis([22 27 -0.25 0.25]);
l = legend('Sensor','Real','EKF','Location','northeast');
set(l,'Interpreter','latex','FontSize',7);
xlabel('');
ylabel('');
title('');
ax = gca;
ax.TickLabelInterpreter = 'latex';

h2 = subplot(3,1,3);
plot(p_ekfui);
grid;
axis([22 27 -0.25 0.25]);
l = legend('Sensor','Real','EKF-UI','Location','northeast');
set(l,'Interpreter','latex','FontSize',7);
ylabel('');
xlabel('Time $t$ (seconds)','Interpreter', 'latex','FontSize',9);
title('');
ax = gca;
ax.TickLabelInterpreter = 'latex';

p1=get(h1,'position');
p2=get(h2,'position');
height=p1(2)+p1(4)-p2(2);
axes('position',[p2(1) p2(2) p2(3) height],'visible','off');

ylabel('Angular body velocity x-axis $p$ (rad/s)','Interpreter', 'latex','visible','on','FontSize',9);

% Error
figure();
hold on;
plot(p_kf.Time,(p_kf.Data(:,2)-p_kf.Data(:,3)).^2);
plot(p_ekf.Time,(p_ekf.Data(:,2)-p_ekf.Data(:,3)).^2);
% plot(p_ekfui.Time,(p_ekfui.Data(:,2)-p_ekfui.Data(:,3)).^2);
l = legend('KF','EKF');
set(l,'Interpreter','latex','FontSize',7);
grid;
axis([0 50 0 1e-3]);
ylabel('Squared error of $p$','Interpreter', 'latex','FontSize',9);
xlabel('Time $t$ (seconds)','Interpreter', 'latex','FontSize',9);
ax = gca;
ax.TickLabelInterpreter = 'latex';

Mean_KF(1) = mean((pn_kf.Data(:,2)-pn_kf.Data(:,3)).^2);
Mean_KF(2) = mean((pe_kf.Data(:,2)-pe_kf.Data(:,3)).^2);
Mean_KF(3) = mean((h_kf.Data(:,2)-h_kf.Data(:,3)).^2);
Mean_KF(4) = mean((u_kf.Data(:,2)-u_kf.Data(:,3)).^2);
Mean_KF(5) = mean((v_kf.Data(:,2)-v_kf.Data(:,3)).^2);
Mean_KF(6) = mean((w_kf.Data(:,2)-w_kf.Data(:,3)).^2);
Mean_KF(7) = mean((phi_kf.Data(:,2)-phi_kf.Data(:,3)).^2);
Mean_KF(8) = mean((theta_kf.Data(:,2)-theta_kf.Data(:,3)).^2);
Mean_KF(9) = mean((psi_kf.Data(:,2)-psi_kf.Data(:,3)).^2);
Mean_KF(10) = mean((p_kf.Data(:,2)-p_kf.Data(:,3)).^2);
Mean_KF(11) = mean((q_kf.Data(:,2)-q_kf.Data(:,3)).^2);
Mean_KF(12) = mean((r_kf.Data(:,2)-r_kf.Data(:,3)).^2);


Mean_EKF(1) = mean((pn_ekf.Data(:,2)-pn_ekf.Data(:,3)).^2);
Mean_EKF(2) = mean((pe_ekf.Data(:,2)-pe_ekf.Data(:,3)).^2);
Mean_EKF(3) = mean((h_ekf.Data(:,2)-h_ekf.Data(:,3)).^2);
Mean_EKF(4) = mean((u_ekf.Data(:,2)-u_ekf.Data(:,3)).^2);
Mean_EKF(5) = mean((v_ekf.Data(:,2)-v_ekf.Data(:,3)).^2);
Mean_EKF(6) = mean((w_ekf.Data(:,2)-w_ekf.Data(:,3)).^2);
Mean_EKF(7) = mean((phi_ekf.Data(:,2)-phi_ekf.Data(:,3)).^2);
Mean_EKF(8) = mean((theta_ekf.Data(:,2)-theta_ekf.Data(:,3)).^2);
Mean_EKF(9) = mean((psi_ekf.Data(:,2)-psi_ekf.Data(:,3)).^2);
Mean_EKF(10) = mean((p_ekf.Data(:,2)-p_ekf.Data(:,3)).^2);
Mean_EKF(11) = mean((q_ekf.Data(:,2)-q_ekf.Data(:,3)).^2);
Mean_EKF(12) = mean((r_ekf.Data(:,2)-r_ekf.Data(:,3)).^2);

Mean_EKFUI(1) = mean((pn_ekfui.Data(:,2)-pn_ekfui.Data(:,3)).^2);
Mean_EKFUI(2) = mean((pe_ekfui.Data(:,2)-pe_ekfui.Data(:,3)).^2);
Mean_EKFUI(3) = mean((h_ekfui.Data(:,2)-h_ekfui.Data(:,3)).^2);
Mean_EKFUI(4) = mean((u_ekfui.Data(:,2)-u_ekfui.Data(:,3)).^2);
Mean_EKFUI(5) = mean((v_ekfui.Data(:,2)-v_ekfui.Data(:,3)).^2);
Mean_EKFUI(6) = mean((w_ekfui.Data(:,2)-w_ekfui.Data(:,3)).^2);
Mean_EKFUI(7) = mean((phi_ekfui.Data(:,2)-phi_ekfui.Data(:,3)).^2);
Mean_EKFUI(8) = mean((theta_ekfui.Data(:,2)-theta_ekfui.Data(:,3)).^2);
Mean_EKFUI(9) = mean((psi_ekfui.Data(:,2)-psi_ekfui.Data(:,3)).^2);
Mean_EKFUI(10) = mean((p_ekfui.Data(:,2)-p_ekfui.Data(:,3)).^2);
Mean_EKFUI(11) = mean((q_ekfui.Data(:,2)-q_ekfui.Data(:,3)).^2);
Mean_EKFUI(12) = mean((r_ekfui.Data(:,2)-r_ekfui.Data(:,3)).^2);

MSE = [Mean_KF' Mean_EKF' Mean_EKFUI'];

% print('-depsc2','-r600','pe.eps')

% %% North position
% figure(2);
% subplot(2,1,1);
% plot(pn);
% grid;
% axis([8 18 -1 6]);
% legend('Sensor','Real','Kalman','Location','northwest');
% ylabel('p_n (meter)');
% title('Kalman Filter');
% 
% subplot(2,1,2);
% plot(pn_ekf);
% grid;
% axis([8 18 -1 6]);
% legend('Sensor','Real','EKF','Location','northwest');
% ylabel('p_n (meter)');
% title('Extended Kalman Filter');
% 
% print('-depsc2','-r600','pn.eps')
% 
% %% Height
% figure(3);
% subplot(2,1,1);
% plot(h);
% grid;
% axis([0 18 -4 1]);
% legend('Sensor','Real','Kalman','Location','northeast');
% ylabel('h (meter)');
% title('Kalman Filter');
% 
% subplot(2,1,2);
% plot(h_ekf);
% grid;
% axis([0 18 -4 1]);
% legend('Sensor','Real','EKF','Location','northeast');
% ylabel('h (meter)');
% title('Extended Kalman Filter');
% 
% print('-depsc2','-r600','h.eps')
% 
% %% Error
% 
% % Pe
% figure(4);
% hold on;
% plot(h.Time,abs(pe.Data(:,2)-pe.Data(:,3)));
% plot(h.Time,abs(pe_ekf.Data(:,2)-pe_ekf.Data(:,3)));
% legend('Kalman','EKF');
% grid;
% axis([8 18 0 .06]);
% ylabel('Absolute error (meter)');
% xlabel('Time (seconds)');
% 
% print('-depsc2','-r600','pe_error.eps')
% 
% % Pn
% figure(5);
% hold on;
% plot(h.Time,abs(pn.Data(:,2)-pn.Data(:,3)));
% plot(h.Time,abs(pn_ekf.Data(:,2)-pn_ekf.Data(:,3)));
% legend('Kalman','EKF');
% grid;
% axis([8 18 0 .05]);
% ylabel('Absolute error (meter)');
% xlabel('Time (seconds)');
% 
% print('-depsc2','-r600','pn_error.eps')
% 
% % H
% figure(6);
% hold on;
% plot(h.Time,abs(h.Data(:,2)-h.Data(:,3)));
% plot(h.Time,abs(h_ekf.Data(:,2)-h_ekf.Data(:,3)));
% legend('Kalman','EKF');
% grid;
% axis([0 18 0 .15]);
% ylabel('Absolute error (meter)');
% xlabel('Time (seconds)');
% 
% print('-depsc2','-r600','h_error.eps')
% 
% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(7);
% subplot(2,1,1);
% plot(w);
% grid;
% % axis([0 18 -4 1]);
% legend('Sensor','Real','Kalman','Location','northeast');
% ylabel('w (m/s)');
% title('Kalman Filter');
% 
% subplot(2,1,2);
% plot(w_ekf);
% grid;
% % axis([0 18 -4 1]);
% legend('Sensor','Real','EKF','Location','northeast');
% ylabel('w (m/s)');
% title('Extended Kalman Filter');
% 
% print('-depsc2','-r600','w.eps')
% 
% %% Error
% figure(8);
% hold on;
% plot(h.Time,abs(w.Data(:,2)-w.Data(:,3)));
% plot(h.Time,abs(w_ekf.Data(:,2)-w_ekf.Data(:,3)));
% legend('Kalman','EKF');
% grid;
% % axis([8 18 0 .16]);
% ylabel('Absolute error (m/s)');
% xlabel('Time (seconds)');
% 
% print('-depsc2','-r600','w_error.eps')