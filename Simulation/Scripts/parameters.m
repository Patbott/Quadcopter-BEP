%% Parameter script
clear;

Ts = 0.005;                % Sample time filter[s]
T_sens = 0.005;            % Sampling time sensors [s]
T = .001;                   % Time step [s]

%% Equations
% Using symbolic toolbox to calculate the Jacobian
syms Jx Jy Jz pndot pedot hdot udot vdot wdot phidot thetadot psidot pdot qdot rdot pn pe h u v w phi theta psi p q r g m k1 k2 delta1 delta2 delta3 delta4 l

F1 = k1*delta1;
F2 = k1*delta2;
F3 = k1*delta3;
F4 = k1*delta4;

F = F1+F2+F3+F4;

tauphi = l*(F1+F4-F2-F3);
tautheta = l*(F1+F2-F3-F4);
taupsi = k2*(delta1+delta3-delta2-delta4);

pndot = w*(sin(phi)*sin(psi)+cos(phi)*cos(psi)*sin(theta))-v*(cos(phi)*sin(psi)-cos(psi)*sin(phi)*sin(theta))+u*cos(psi)*cos(theta);
pedot = v*(cos(phi)*cos(psi)+sin(phi)*sin(psi)*sin(theta))-w*(cos(psi)*sin(phi)-cos(phi)*sin(psi)*sin(theta))+u*cos(theta)*sin(psi);
hdot = w*cos(phi)*cos(theta)-u*sin(theta)+v*cos(theta)*sin(phi);
udot = r*v-q*w-g*sin(theta);
vdot = p*w - r*u +g*cos(theta)*sin(phi);
wdot = q*u-p*v-F/m + g*cos(phi)*cos(theta);
phidot = p+r*cos(phi)*tan(theta)+q*sin(phi)*tan(theta);
thetadot = q*cos(phi)-r*sin(phi);
psidot = r*cos(phi)/cos(theta)+q*sin(phi)/cos(theta);
pdot = tauphi/Jx + q*r*(Jy - Jz)/Jx;
qdot = tautheta/Jy + p*r*(Jz - Jx)/Jy;
rdot = taupsi/Jz + p*q*(Jx - Jy)/Jz;

f = [pndot;pedot;hdot;udot;vdot;wdot;phidot;thetadot;psidot;pdot;qdot;rdot];
x = [pn;pe;h;u;v;w;phi;theta;psi;p;q;r];
i = [delta1;delta2;delta3;delta4];

% Forward Euler method
fdsym = x+f*Ts;

%% Linearization
Adsym = jacobian(fdsym,x);
Bdsym = jacobian(fdsym,i);

%% Constants
g  = 9.81;              % Gravitational acceleration    [ms^-2]

m  = 1.62;             % Mass of the drone             [kg]

l  = 0.147;             % Distance propellor to axix    [m]

Jx = 0.0318;            % Inertia around x-axis         [kg m^2]
Jy = 0.0424;            % Inertia around y-axis         [kg m^2]
Jz = 0.0252;            % Inertia around z-axis         [kg m^2]
I  = diag([Jx;Jy;Jz]);  % Inertia matrix                [kg m^2]

k1 = 1.2;
k2 = 1.2;

hv = (m*g)/(4*k1);

% Non linear discretized function for EKF
fd = subs(fdsym);
Ad = subs(Adsym);
Bd = subs(Bdsym);

%% Write the correct linearized equations to a function
run('write_subA');
run('write_subF');
run('write_subB');

% Linearization point:
x0 = zeros(12,1);
i0 = ones(4,1)*hv;

A = subA(x0,i0);
B = subB();
C = eye(12); 

%% Constant for Filter + Controller
% EKF Q and R
Q = eye(12)*1e-6;

% LQRI
LQ = diag([10 10 10 20 20 20 10 10 10 1 1 1]);
LR = diag([5 5 5 5]);

% Klqi = lqi(sysd,LQq,LR);
K = dlqr(A,B,LQ,LR);
Ki = 2;

clearvars -except A B C Q g m l I k1 k2 T Ts T_sens LQ LR K Ki x0 i0