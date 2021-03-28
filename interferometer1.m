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
t = linspace(0,1.5*T,len);

wave1 = exp(-1j*( k*z(1) - w.*t ));
wave2 = exp(-1j*( k*z(2) - w.*t ));

figure(1)
    sgtitle('Interferência');
subplot(2,2,1)
    plot(t/T,real(wave1),'--'); hold on;
    plot(t/T,real(wave2),'--');
    plot(t/T,real(wave1 + wave2),'k' );
    plot(t/T,zeros(1,len),'k');
    ylabel('Amplitude (u.a.)');

z = [dist dist+3*dz];
wave1 = exp(-1j*( k*z(1) - w.*t ));
wave2 = exp(-1j*( k*z(2) - w.*t ));
subplot(2,2,2)
    plot(t/T,real(wave1)); hold on;
    plot(t/T,real(wave2),'--');
    plot(t/T,real(wave1 + wave2),'k' );
    plot(t/T,zeros(1,len),'k');
    
z = [dist dist+0.006*dz];
wave1 = exp(-1j*( k*z(1) - w.*t ));
wave2 = exp(-1j*( k*z(2) - w.*t ));
subplot(2,2,3)
plot(t/T,real(wave1),'--'); hold on;
    plot(t/T,real(wave2),'--');
    plot(t/T,real(wave1 + wave2),'k' );
    plot(t/T,zeros(1,len),'k');
    xlabel('t/T');
    ylabel('Amplitude (u.a.)');
    
z = [dist dist+0.0075*dz];
wave1 = exp(-1j*( k*z(1) - w.*t ));
wave2 = exp(-1j*( k*z(2) - w.*t ));
subplot(2,2,4)
plot(t/T,real(wave1),'--'); hold on;
    plot(t/T,real(wave2),'--');
    plot(t/T,real(wave1 + wave2),'k' );
    plot(t/T,zeros(1,len),'k');
    xlabel('t/T');
