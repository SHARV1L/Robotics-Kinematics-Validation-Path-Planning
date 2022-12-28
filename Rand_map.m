%% Basic Probabilistic Workspace Sampling of Dobot X0-Z0 Workspace Plane
% Stevens Institute of Technology
% Mechanical Engineering Department
% ME 598, Introduciton to Robotics
%Group_8
xVals = 10+20*rand(1,15);
zVals = 20*rand(1,15);
figure(3)
plot(xVals, zVals,'x')
axis equal
xlim([10, 30])
ylim([0, 20])
grid minor
grid
circle(20,3.5,3.5,'b',1);
circle(20,3.5,6,'y',5);
xlabel('X coordinate [cm]')
ylabel('Z coordinate [cm]')
title('Dobot X0-Z0 Plane Workspace')
function h = circle(x,z,r,color,lw)
hold on 
th = 0:pi/50:2*pi;
xunit = r*cos(th)+ x;
zunit = r*sin(th)+ z;
h = plot(xunit, zunit,color,'LineWidth',lw);
hold off
end

