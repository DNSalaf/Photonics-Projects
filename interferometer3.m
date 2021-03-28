len = 1000;

% Parameters
lambda = linspace(1400e-9, 1600e-9, len);
freq = physconst('LightSpeed')./lambda;
w = 2*pi*freq;
k = 2*pi./lambda;

T = 1/freq(end); % maior tempo necessário para verificar toda a extensão da onda

Temp = 27:50;
dist = 2e-2;
dz = 0.05e-6*(Temp-27) + 0.1e-3;
z = dist + dz;
t = linspace(0,T,100);

A = zeros(length(Temp),len);
for m = 1:length(Temp)
    for n = 1:len
        wave1 = exp(-1j*( k(n)*dist - w(n).*t )); % short path
        wave2 = exp(-1j*( k(n)*z(m) - w(n).*t )); % long  path

        A(m,n) = max( real(wave1 + wave2) );        % amplitude
    end
end
nm = 1e-9;
figure(1)
    plot(lambda/nm, A(1,:)); hold on
    plot(lambda/nm, A(5,:));
    plot(lambda/nm, A(10,:));
    plot(lambda/nm, A(15,:));
    xlabel('Comprimento de Onda (nm)');
    ylabel('Amplitude (u.a.)');
    title('Interferômetro Mach-Zehnder');
    axis([1480 1520 0 2])
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
    
    
    