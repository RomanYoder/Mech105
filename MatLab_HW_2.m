%Problem 1
% 
% clc;clear;
% t=0:0.05:0.8;
% Q0=10,R=60,L=9,C1=0.00005,C2=0.0005;
% Ex1=Q0*exp(-R.*t/2*L);
% cos1=cos(sqrt((1/(L*C1))-(((R/(L*2))^2).*t)));
% cos2=cos(sqrt((1/(L*C2))-(((R/(L*2))^2).*t)));
% SofQ1=Ex1.*cos1;
% SofQ2=Ex1.*cos2;
% figure
% subplot(2,1,1);
% plot(t,SofQ1);
% subplot(2,1,2);
% plot(t,SofQ2);

%The graphs change when the capacitor goes up because value inside of the
%square root would increase; leading to a diffrence in the cos function and
%a change in slope.
%feel free to change which problem is commented out!
%Problem 2
clc;clear;
t=10:10:60;
t2=0:5:70
%time values
coft=4.84*exp(-0.034.*t);
coft2=4.84*exp(-0.034.*t2);

figure
subplot(2,1,1);
plot(t,coft,'dr');
subplot(2,1,2);
plot(t2,coft2,'--g');