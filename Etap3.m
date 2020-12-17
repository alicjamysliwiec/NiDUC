clear;
%---------------------------Symulacja bez przeklaman na kanale transmisyjnym-----------------------%
N = 16384; % Ilosc bitow wejsciowych
register_DVB = [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0]; % Inicjalizacja rejestru dla DVB
register_V34 = [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0]; % Inicjalizacja rejestru dla v.34
%---------------------------Losowe dane na wejsciu---------------------------%
%Generator ciagu bitow o zadanej dlugosci
for i = 1:N 
  temp = rand();
  if temp > 0.5 %Przyjmujemy, ze dla wartosci powyzej 0.5, bit bedzie mial wartosc 1
    data(i) = 1;
  else          %Przyjmujemy, ze dla wartosci ponizej 0.5, bit bedzie mial wartosc 0
    data(i) = 0;
  end
endfor

%---------------------------Zaleznosc A od p---------------------------%
A1 = A2 = A3 = [];
k = 9; % Dlugosc sekwencji zer
I = 256; % Czas powrotu synchronizacji
p_range = 0:0.05:0.5; % Prawopodobienstwa wystapienia przeklamania
for p = p_range
  % Bez scramblera
  scrambled_data = data;
  transmitted_data = Misrepresentation(scrambled_data, p); % Powstanie zaklaman na kanale transmisyjnym
  synchronized_bits = Synchronization(transmitted_data, k, I); % Zliczanie ilosci desynchronizacji przy odbiorze danych
  A1 = [A1, synchronized_bits / N];

  % Scrambler DVB
  scrambled_data = Scramble_DVB(data, register_DVB);
  transmitted_data = Misrepresentation(scrambled_data, p); % Powstanie zaklaman na kanale transmisyjnym
  synchronized_bits = Synchronization(transmitted_data, k, I); % Zliczanie ilosci desynchronizacji przy odbiorze danych
  A2 = [A2, synchronized_bits / N];

  % Scrambler v.34
  scrambled_data = Scramble_V34(data, register_V34);
  transmitted_data = Misrepresentation(scrambled_data, p); % Powstanie zaklaman na kanale transmisyjnym
  synchronized_bits = Synchronization(transmitted_data, k, I); % Zliczanie ilosci desynchronizacji przy odbiorze danych
  A3 = [A3, synchronized_bits / N];
endfor
p_range = p_range*100;

figure(1)
plot(p_range, A1,'LineWidth', 2)
hold on
plot(p_range, A2,'LineWidth', 2)
plot(p_range, A3,'LineWidth', 2)
hold off

title('Zaleznosc wspolczynnika A od prawdopodobienstwa przeklamania bitu, k = 9, I = 256')
xlabel('Prawdopodobienstwo przeklamania bitu w kanale transmisyjnym [%]')
ylabel('Wspolczynnik pozostania w stanie synchronizacji')
legend({'Bez scramblera', 'Scrambler DVB', 'Scrambler v.34'},'Location','southwest')
legend('boxoff')
axis([0 50])

%---------------------------Zaleznosc A od k---------------------------%
A1 = A2 = A3 = [];
k_range = [4,5,6,7,8,9,10,11,12,13]; % Dlugosc sekwencji zer
I = 256; % Czas powrotu synchronizacji
p = 0; % Prawopodobienstwo wystapienia przeklamania
for k = k_range
  % Bez scramblera
  scrambled_data = data;
  transmitted_data = Misrepresentation(scrambled_data, p); % Powstanie zaklaman na kanale transmisyjnym
  synchronized_bits = Synchronization(transmitted_data, k, I); % Zliczanie ilosci desynchronizacji przy odbiorze danych
  A1 = [A1, synchronized_bits / N];

  % Scrambler DVB
  scrambled_data = Scramble_DVB(data, register_DVB);
  transmitted_data = Misrepresentation(scrambled_data, p); % Powstanie zaklaman na kanale transmisyjnym
  synchronized_bits = Synchronization(transmitted_data, k, I); % Zliczanie ilosci desynchronizacji przy odbiorze danych
  A2 = [A2, synchronized_bits / N];

  % Scrambler v.34
  scrambled_data = Scramble_V34(data, register_V34);
  transmitted_data = Misrepresentation(scrambled_data, p); % Powstanie zaklaman na kanale transmisyjnym
  synchronized_bits = Synchronization(transmitted_data, k, I); % Zliczanie ilosci desynchronizacji przy odbiorze danych
  A3 = [A3, synchronized_bits / N];
endfor

figure(2)
plot(k_range, A1,'LineWidth', 2)
hold on
plot(k_range, A2,'LineWidth', 2)
plot(k_range, A3,'LineWidth', 2)
hold off

title('Zaleznosc wspolczynnika <A> od ilosci kolejnych zer <k>, p = 0%, I = 256')
xlabel('Ilosc nastepujacych po sobie zer potrzebnych do desynchronizacji')
ylabel('Wspolczynnik pozostania w stanie synchronizacji')
legend({'Bez scramblera', 'Scrambler DVB', 'Scrambler v.34'},'Location','southeast')
legend('boxoff')
axis([4 13])

%---------------------------Zaleznosc A od I---------------------------%
A1 = A2 = A3 = [];
k = 9; % Dlugosc sekwencji zer
I_range = [256,384,512,640,768,896,1024,1152,1280,1408,1536]; % Czas powrotu synchronizacji
p = 0; % Prawopodobienstwo wystapienia przeklamania
for I = I_range
  % Bez scramblera
  scrambled_data = data;
  transmitted_data = Misrepresentation(scrambled_data, p); % Powstanie zaklaman na kanale transmisyjnym
  synchronized_bits = Synchronization(transmitted_data, k, I); % Zliczanie ilosci desynchronizacji przy odbiorze danych
  A1 = [A1, synchronized_bits / N];

  % Scrambler DVB
  scrambled_data = Scramble_DVB(data, register_DVB);
  transmitted_data = Misrepresentation(scrambled_data, p); % Powstanie zaklaman na kanale transmisyjnym
  synchronized_bits = Synchronization(transmitted_data, k, I); % Zliczanie ilosci desynchronizacji przy odbiorze danych
  A2 = [A2, synchronized_bits / N];

  % Scrambler v.34
  scrambled_data = Scramble_V34(data, register_V34);
  transmitted_data = Misrepresentation(scrambled_data, p); % Powstanie zaklaman na kanale transmisyjnym
  synchronized_bits = Synchronization(transmitted_data, k, I); % Zliczanie ilosci desynchronizacji przy odbiorze danych
  A3 = [A3, synchronized_bits / N];
endfor

figure(3)
plot(I_range, A1,'LineWidth', 2)
hold on
plot(I_range, A2,'LineWidth', 2)
plot(I_range, A3,'LineWidth', 2)
hold off

title('Zaleznosc wspolczynnika <A> od czasu potrzebnego na odzyskanie synchronizacji <I>, p = 0%, k = 9')
xlabel('Czas potrzebny na odzyskanie synchronizacji [w bitach]')
ylabel('Wspolczynnik pozostania w stanie synchronizacji')
legend({'Bez scramblera', 'Scrambler DVB', 'Scrambler v.34'},'Location','southwest')
legend('boxoff')
axis([256 1536])