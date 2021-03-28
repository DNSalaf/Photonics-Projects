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
    axis([1460 1540 0 2])

[M,ind] = max(A(1,1:575));
lambda0 = lambda(ind);

desloc = zeros(length(dz),1);
desloc(1) = lambda0;

for m = 2:length(dz)
   [M,ind] = max(A(m,463:575));
   desloc(m) = lambda(ind+462);
end
    
    
% figure(2)
%     plot(lambda/nm, db(A(1,:),'power')); hold on
%     plot(lambda/nm, db(A(5,:),'power'));
%     plot(lambda/nm, db(A(10,:),'power'));
%     plot(lambda/nm, db(A(15,:),'power'));
%     xlabel('Comprimento de Onda (nm)');
%     ylabel('Amplitude (dB)');
%     title('Interferômetro Mach-Zehnder');
%     axis([1460 1540 -40 20])
% figure(2)
%     plot(lambda/nm, A); hold on;
%     plot(lambda/nm, B);
%     xlabel('Comprimento de Onda (nm)');
%     ylabel('Amplitude (u.a.)');
%     title('Interferômetro Mach-Zehnder');
% 
Temp = 27:50;
figure(3)
    plot(Temp, desloc/nm,'.');
    xlabel('Temperatura (ºC)');
    ylabel('Comp de Onda Central (nm)');
    title('Comp. de Onda Central \times Temperatura ');
    legend('sensitividade = 0.8008 nm/ºC')
    
    
    
