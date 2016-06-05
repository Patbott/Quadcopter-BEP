clear; close all;

n = 1:1000;
KF = importdata('estimator_ekf_kalman.log',',');
EKF = importdata('estimator_ekf_EKF.log',',');
EKFUI = importdata('estimator_ekf_EKFUI.log',',');

figure();
hold on;
plot(n,KF);
plot(n,EKF);
plot(n,EKFUI);
grid;
axis([0 1000 4e-3 11e-3]);
l = legend('KF','EKF','EKF-UI','Location','northeast');
set(l,'Interpreter','latex','FontSize',7);
xlabel('Iteration $k$ (-)','Interpreter', 'latex','FontSize',9);
ylabel('Calculation time (seconds)','Interpreter', 'latex','FontSize',9);
ax = gca;
ax.TickLabelInterpreter = 'latex';

KF_Hz = 1/mean(KF)
EKF_Hz = 1/mean(EKF)
EKFUI_Hz = 1/mean(EKFUI)

faster = (mean([KF_Hz EKF_Hz])-EKFUI_Hz)/EKFUI_Hz*100