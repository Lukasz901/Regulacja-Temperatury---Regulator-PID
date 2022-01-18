close all
temperature = load('pom_SM_LAB.txt'); %próbki temperatury podawane w postaci 1 kolumny (pionowo)
temperature = temperature';
dt=1; %szybkoœæ próbkowania 
liczba_probek = length(temperature);
t = (0:liczba_probek-1)*dt;

%Sygna³ wymuszaj¹cy
Amplituda = 0.9;
wejscie = Amplituda*ones( 1 ,liczba_probek); 

%Model
s = tf('s');
k = 7.3/Amplituda;   %model gain
T = 335;    %model time constant
delay=10;   %model delay
H = k/(1+s*T)*exp(-s*delay); % model
disp(sprintf('Paarmetry Modelu: k=%.2g, T=%g, delay=%g\n', k, T, delay));

%OdpowiedŸ modelu
model_response = lsim(H,wejscie,t);
model_response = model_response + 23.2; %add offset

%B³¹d
residuum = temperature - model_response';
error_abs_sum = sum(abs(residuum));
disp(sprintf('Model error sum(abs(residuum)) = %g\n', error_abs_sum));

%Wykresy
figure(1);
plot(t,temperature, '.', t, model_response, '.');
title('Przebieg temperatury w funkcji czasu');
xlabel('t (s)');
ylabel('Temperatura (C)');
legend('pomiary', 'odpowiedz modelu');
axis tight;

figure(2);
plot(t,residuum, '.');
title('Przebie b³êdu (próbki - odpowedŸ modelu');
xlabel('t (s)');
ylabel('Temperatura (C)');
axis tight;
ylim([-0.5 0.5]);




