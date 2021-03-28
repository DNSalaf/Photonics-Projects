len = 10000;

% Parameters
lambda = linspace(1400e-9, 1600e-9, len);
freq = physconst('LightSpeed')./lambda;
w = 2*pi*freq;
k = 2*pi./lambda;

T = 1/freq(end); % maior tempo necessário par verificar toda a extensão da onda

Temp = 27;
dist = 2e-2;
dz = 0.05e-6*(Temp-27) + 0.1e-3;
z = [dist dist+dz];
t = linspace(0,T,100);

A = zeros(len,1);
for m = 1:len
    wave1 = exp(-1j*( k(m)*z(1) - w(m).*t )); % short path
    wave2 = exp(-1j*( k(m)*z(2) - w(m).*t )); % long  path

    A(m) = max( real(wave1 + wave2) );        % amplitude
end

nm = 1e-9;
figure(1)
    plot(lambda/nm, A);
    xlabel('Comprimento de Onda (nm)');
    ylabel('Amplitude (u.a.)');
    title('Interferômetro Mach-Zehnder');

% figure(2)
%     plot(lambda/nm, A); hold on;
%     plot(lambda/nm, B);
%     xlabel('Comprimento de Onda (nm)');
%     ylabel('Amplitude (u.a.)');
%     title('Interferômetro Mach-Zehnder');
% 
% Temp = 27:50;
% ddz = 0.05e-6*(Temp-27);
% figure(3)
%     plot(Temp, ddz/nm);
%     xlabel('Temperatura (ºC)');
%     ylabel('Dilatamento (nm)');
%     title('Dilatamento linear da fibra em função da Temperatura ');
    
    
    