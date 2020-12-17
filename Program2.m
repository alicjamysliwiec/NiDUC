clear;
%---------------------------Symulacja z przeklamaniami na kanale transmisyjnym-----------------------%
N = 1000; % Ilosc bitow wejsciowych
p_range = 0:0.01:1;
register_DVB = [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0]; % Inicjalizacja rejestru dla DVB
register_V34 = [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0]; % Inicjalizacja rejestru dla v.34
fig1 = figure('Name','Scrambler DVB','NumberTitle','off');
fig2 = figure('Name','Scrambler v.34','NumberTitle','off');

%---------------------------Losowe dane na wejsciu-----------------
%Generator ciagu bitow o zadanej dlugosci
for i = 1:N 
  temp = rand();
  if temp > 0.5 % Przyjmujemy, ze dla wartosci powyzej 0.5, bit bedzie mial wartosc 1
    data(i) = 1;
  else          % Przyjmujemy, ze dla wartosci ponizej 0.5, bit bedzie mial wartosc 0
    data(i) = 0;
  end
endfor

% Scrambler DVB
figure(fig1);
scrambled_data = Scramble_DVB(data, register_DVB); % Przeprowadz skrablowanie na danych w standardzie DVB
BER = {}; % Utworz pusty wektor przechowujacy wskaznik BER dla kolejnych 'p' (prawdopodobienstwo przeklamania bitu)
for p = p_range
  transmitted_data = Misrepresentation(scrambled_data, p); % Zasymuluj wystapienie przeklaman na kanale transmisyjnym
  descrambled_data = Descramble_DVB(transmitted_data, register_DVB); % Przeprowadz deskramblowanie danych, ktore przeszly przez kanal transmisyjnych
  BER(end+1) = numel(find(descrambled_data!=data))/N; % Oblicz i dodaj na koniec wektora wartosc wskaznika BER
endfor
BER = cell2mat(BER);
display(scrambled_data);
display(descrambled_data);

subplot(211)
histData = BitSequence(scrambled_data); % Zamien otrzymane dane na postac umozliwiajaca wygenerowanie histogramu
hist(histData,length(histData)); % Wygeneruj histogram
title('Losowe dane na wejsciu');
xlabel('Liczba kolejnych takich samych bitow');
ylabel('Liczba  przypadkow');

subplot(212)
plot(p_range, BER); % Wygeneruj wykres zaleznosci wartosci wskaznika BER od 'p' - prawdopodobienstwa wystapienia przeklamania
title('Wskaznik BER');
xlabel('Prawdopodobienstwo przeklamiania');
ylabel('Wartosc wskaznika BER');

% Scrambler v.34
figure(fig2);
scrambled_data = Scramble_V34(data, register_V34);
BER = {};
for p = p_range
  transmitted_data = Misrepresentation(scrambled_data, p);
  descrambled_data = Descramble_V34(transmitted_data, register_V34);
  BER(end+1) = numel(find(descrambled_data!=data))/N;
endfor
BER = cell2mat(BER);
display(scrambled_data);
display(descrambled_data);

subplot(211)
histData = BitSequence(scrambled_data);
hist(histData,length(histData));
title('Losowe dane na wejsciu');
xlabel('Liczba kolejnych takich samych bitow');
ylabel('Liczba  przypadkow');

subplot(212)
plot(p_range, BER);
title('Wskaznik BER');
xlabel('Prawdopodobienstwo przeklamiania');
ylabel('Wartosc wskaznika BER');
