%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Patrick Koelewijn - 2016         %
%   p.j.w.koelewijn@student.tue.nl   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

%% Add folders
addpath('Scripts');
addpath('Functions');           
addpath('Models');

%% Initialize parameters
disp('Calculating parameters...');
run('parameters');

%% Running the models
%KF
disp('Running Simulation with KF...');
sim('model_kf');

% EKF
disp('Running Simulation with EKF...');
sim('model_ekf');

% EKF-UI
disp('Running Simulation with EKF-UI...');
sim('model_ekfui');

%% Plot results
disp('Plotting...');
run('plotting');
clear;

disp('Done!');