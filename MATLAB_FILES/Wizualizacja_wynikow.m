close all
TMP = load('TESTOWE_POMIARY.csv'); %WCZYTANIE PLIKU (Z PLIKU ZAPISANEGO 
                                %ZA POMOC� TelemetryViewer nale�y usun��
                                %nag��wek

%zmienne 
dt = 1

t = TMP(:,1);
t = t*dt;
T = TMP(:,3);
PWM = TMP(:,4);

%wykresy
%TEMPERATURA
plot(t,T)
title('Wykres temperatury w funkcji czasu');
grid on
xlabel('t [s]');
ylabel(' Temperatura [C]');

%PWM
figure()
plot(t,PWM)
title('Wykres funkcji steruj�cej w funkcji czasu');
grid on
xlabel('t [s]');
ylabel(' PWM');