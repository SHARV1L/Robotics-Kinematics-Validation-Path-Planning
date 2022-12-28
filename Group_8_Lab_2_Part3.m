%% Group_8 Dobotsimulation
% Rakesh; Shiv; Sharvil
% Last revision: Feb. 22, 2018
% 
% Stevens Institute of Technology
% Mechanical Engineering Department
% ME 598, Introduciton to Robotics


%%

% Clean up the workspace etc. so that variables are clear, as is the
% instrument (COM) configuration
clear all;
close all;
clc;
instrreset

% Configure Dobot parameters for MATLAB communication
serport = 'COM8';
dobot = serial(serport, 'BaudRate' ,9600);

% Establish serial (USB) connection
fopen(dobot)

% Read current Dobot state
% Output the measured configuration and vacuum condition
[q_act, pump] = dobotReadDH(dobot)

%%

% Settings for simulator
multiplot   = 1;
fignummulti = 1; 
fignumXZ    = 2;

figure(fignummulti)
clf

figure(fignumXZ)
clf
% Vacuum parameter: 0=OFF, 1=ON
% Home Position
desSuction = 0;
q_des = [-2; 76; -75; 0; 0]
dobotWriteDH(dobot, q_des, desSuction);
pause(3)

% Position #1
%bringing the dobot to pick the ball from the position_1 
desSuction = 0; 
q_des = [-34; 30; -71; 45; 0]
dobotWriteDH(dobot, q_des, desSuction);
 pause(3)

 % on the suction to pick and hold the ball
desSuction = 1;
q_des = [-34; 30; -71; 45; 0]
dobotWriteDH(dobot, q_des, desSuction);
pause(3)

%pick the ball from the position_1 and lift it up 
desSuction = 1;
q_des = [-34; 76; -75; 0; 0]
dobotWriteDH(dobot, q_des, desSuction);
pause(3)

%come to the home position after picking the ball from position_1
desSuction = 1;
q_des = [-2; 76; -75; 0; 0]
dobotWriteDH(dobot, q_des, desSuction);
pause(3)

% from home position of the bobot place the ball at position_2
desSuction = 1;
q_des = [20; 22; -58; 0; 0]
dobotWriteDH(dobot, q_des, desSuction);
pause(3)

% release the ball after placing at the desired position_2
desSuction = 0;
q_des = [20; 22; -58; 0; 0]
dobotWriteDH(dobot, q_des, desSuction);
pause(3)

% bring the dobot to the home position after completeing the task 
% Home Position
desSuction = 0;
q_des = [-2; 76; -75; 0; 0]
dobotWriteDH(dobot, q_des, desSuction);
pause(3)

% Simulate behavior
dobotPlotXZ(q_des,fignumXZ);
dobotPlot(q_des,fignummulti,multiplot);
    
% Make Dobot move to desired configuration + vacuum state
dobotWriteDH(dobot, q_des, desSuction);

% Pause to give Dobot time to reach commanded configuration
pause(3)
    
% Read current Dobot state
[q_act, pump] = dobotReadDH(dobot)

% Check configuration error
err_q = q_des - q_act

%%

% Disable Dobot object and release COM port (important)
fclose(dobot)
clear all;
instrreset