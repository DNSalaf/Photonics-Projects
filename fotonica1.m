%Trabalho Computacional - Introdução à Fotônica.
%Alunos: Alaf do Nascimento Santos, Gustavo Rossi Martins.

clear all, close all, clc;

while 1
    phi = 0; %fase da segunda onda dada em graus
    while phi < 360
        phi2 = phi*pi/180 %convertendo para radiano
        phi = phi + 1;

        E0 = 1; %amplitude da onda
        w = 50; %velocidade angular
        k = 1;
        z = 0;
        t = linspace(0, 1, 5000); %vetor tempo

        E1 = E0*cos(w*t - k*z);
        E2 = E0*cos(w*t - k*z + phi2);

        figure(1);
        subplot(2,1,1);
        plot(t,E1,t,E2,'k');
        xlabel('Tempo [s]');
        ylabel('Amplitude [V/m]');
        subplot(2,1,2);
        plot(t, E1 + E2, 'g', 'LineWidth',2);
        xlabel('Tempo [s]');
        ylabel('Amplitude [V/m]');
        axis([0 1 -2 2]);

        pause(0.0001);
    end
end



