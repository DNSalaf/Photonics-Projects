%Trabalho Computacional - Introdução à Fotônica.
%Alunos: Alaf do Nascimento Santos, Gustavo Rossi Martins.
clear all, close all, clc;

%% Parameters and constants
len = 1000; %1000 comprimentos de ondas entre 1400nm e 1600nm
lambda = linspace(1400e-9, 1600e-9, len); %vetor comprimento de onda
freq = physconst('LightSpeed')./lambda; %vetor frequencia
w = 2*pi*freq; %vetor frequencia angular
k = 2*pi./lambda; %vetor numero de onda
T = 1/freq(end); % maior tempo necessário para verificar toda a extensão da onda
t = linspace(0,T,len/10);
dist = 2e-2; %tamanho de 2cm dos braços
dz = 0.1e-3; %diferença entre os braços
nm = 1e-9; % para deixar em unidade de nanometro
z = [dist dist+dz];


%% GRAFICO 1 
A = zeros(len,1);
for m = 1:len
    wave1 = exp(-1j*( k(m)*z(1) - w(m).*t )); % short path
    wave2 = exp(-1j*( k(m)*z(2) - w(m).*t )); % long  path
    A(m) = max( real(wave1 + wave2) );        % amplitude
end

A2 = A;
lambda2 = lambda/nm;
% figure(1)
% plot(lambda2, A2);
% xlabel('Comprimento de Onda (nm)');
% ylabel('Amplitude (u.a.)');
% title('Interferômetro Mach-Zehnder');


%% GRAFICO 2
Temp = 27:50; % Temperatura variando de 27 a 50°C
dz = 0.05e-6*(Temp-27) + 0.1e-3; % 0.05um por grau + 0.1mm
z = dist + dz;

A = zeros(length(Temp),len); % inicializa matriz 24x1000
for m = 1:length(Temp)
    for n = 1:len
        wave1 = exp(-1j*( k(n)*dist - w(n).*t )); % short path
        wave2 = exp(-1j*( k(n)*z(m) - w(n).*t )); % long  path
        A(m,n) = max( real(wave1 + wave2) );      % amplitude
    end
end

% figure(2)
% plot(lambda/nm, A(1,:)); hold on
% plot(lambda/nm, A(5,:));
% plot(lambda/nm, A(10,:));
% plot(lambda/nm, A(15,:));
% xlabel('Comprimento de Onda (nm)');
% ylabel('Amplitude (u.a.)');
% title('Interferômetro Mach-Zehnder');
% axis([1480 1520 0 2])

%% GRAFICO 3
[M,ind] = max(A(1,1:575));
lambda0 = lambda(ind);

desloc = zeros(length(dz),1);
desloc(1) = lambda0;

for m = 2:length(dz)
   [M,ind] = max(A(m,463:575));
   desloc(m) = lambda(ind+462);
end
     
sensi = (desloc(2) - desloc(1))/ nm;

% figure(3)
% plot(Temp, desloc/nm,'.');
% xlabel('Temperatura (ºC)');
% ylabel('Comp de Onda Central (nm)');
% title('Comp. de Onda Central \times Temperatura ');
% legend(['sensitividade = ' num2str(sensi) ' nm/ºC']);
% axis([25 52 1490 1515])

%% INTERFACE COM USUARIO

prompt = {'Resposta em comprimento de onda? S/N', 'Resposta a variação de temperatura? S/N', 'Sensitividade? S/N'}; %titulos das caixas de texto editável
dims = [1 50]; %dimensão da caixa de texto
entrada = inputdlg(prompt,'Escolha de Saídas',dims); %variavel que guarda as entradas
R1 = double(entrada{1});
R2 = double(entrada{2});
R3 = double(entrada{3});
%S = 83, N = 78, s = 115, n = 110

if(R1 == 83 || R1 == 115)
    figure(1)
    plot(lambda2, A2);
    xlabel('Comprimento de Onda (nm)');
    ylabel('Amplitude (u.a.)');
    title('Interferômetro Mach-Zehnder');
end

if(R2 == 83 || R2 == 115)
    figure(2)
    plot(lambda/nm, A(1,:)); hold on
    plot(lambda/nm, A(5,:));
    plot(lambda/nm, A(10,:));
    plot(lambda/nm, A(15,:));
    xlabel('Comprimento de Onda (nm)');
    ylabel('Amplitude (u.a.)');
    title('Interferômetro Mach-Zehnder');
    axis([1480 1520 0 2])
end

if(R3 == 83 || R3 == 115)
    figure(3)
    plot(Temp, desloc/nm,'.');
    xlabel('Temperatura (ºC)');
    ylabel('Comp de Onda Central (nm)');
    title('Comp. de Onda Central \times Temperatura ');
    legend(['sensitividade = ' num2str(sensi) ' nm/ºC']);
    axis([25 52 1490 1515])
end



