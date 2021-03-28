close all; clc

len = 1000;

% Parameters
lambda = 1500e-9;
freq = physconst('LightSpeed')/lambda;
w = 2*pi*freq;
k = 2*pi/lambda;
T = 1/freq;

dist = 2e-2;
dz = 0.1e-3;
z = [dist dist+dz];
t = linspace(0,T,len);

wave1 = exp(-1j*( k*z(1) - w.*t ));
wave2 = exp(-1j*( k*z(2) - w.*t ));

figure(1)
    plot(t/T,real(wave1)); hold on;
    plot(t/T,real(wave2));
    plot(t/T,real(wave1 + wave2) );
    plot(t/T,zeros(1,len),'k');
    xlabel('t/T');
    ylabel('Amplitude (u.a.)');
    legend('Short Path','Long Path','Interferência');
    title('Interferômetro Mach-Zehnder');