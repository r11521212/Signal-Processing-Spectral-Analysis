clc;clear;close all;

data = importdata("HW3- building seismic response data.txt");
t = data(:,1);
ground = data(:,2);
top = data(:,3);

% figure(1)
% plot(t,ground)
% xlabel('Time (s)')
% ylabel('Acceleration (gal)')
% title('Acceleration vs Time for Ground Floor')
% 
% figure(2)
% plot(t,top)
% xlabel('Time (s)')
% ylabel('Acceleration (gal)')
% title('Acceleration vs Time for Top Floor')

T = 200/20480;
fs = 1/T;
% (a)
autoground = xcorr(ground, length(ground)/4);
autotop = xcorr(top, length(top)/4);
point2 = (0:1:(length(autoground)-1))';
point = point2-length(top)/4;

% figure(3)
% plot(point,autoground)
% xlabel('Point')
% ylabel('Ampitude')
% title('Acceleration Function of Ground Floor')

autog = zeros(size(autoground));
autot = zeros(size(autotop));
autog(1:5121) = autoground(5120:10240);
autot(1:5121) = autotop(5120:10240);

figure(4)
plot(point2,autog)
xlim([0,10240])
xlabel('Point')
ylabel('Ampitude')
title('Acceleration Function of Ground Floor with Added Zeros')

figure(5)
plot(point2,autot)
xlim([0,10240])
xlabel('Point')
ylabel('Ampitude')
title('Acceleration Function of Top Floor with Added Zeros')

% (b)
crossgt2 = xcorr(ground,top,length(top)/4);
crossgt = zeros(size(crossgt2));
crossgt(1:5121) = crossgt2(5120:10240);

crosstg2 = xcorr(top,ground,length(top)/4);
crosstg = zeros(size(crosstg2));
crosstg(1:5121) = crosstg2(5120:10240);

figure(6)
plot(point2,crossgt)
xlim([0,10240])
xlabel('Point')
ylabel('Ampitude')
title('Cross-Correlation Function of Ground-to-Top Floor(Sxy)')

figure(7)
plot(point2,crosstg)
xlim([0,10240])
xlabel('Point')
ylabel('Ampitude')
title('Cross-Correlation Function of Top-to-Ground Floor(Syx)')







