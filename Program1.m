clear;
%---------------------------Symulacja bez przeklaman na kanale transmisyjnym-----------------------%
N = 1000; % Ilosc bitow wejsciowych
register_DVB = [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0]; % Inicjalizacja rejestru dla DVB
register_V34 = [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0]; % Inicjalizacja rejestru dla v.34
fig1 = figure('Name','Scrambler DVB','NumberTitle','off');
fig2 = figure('Name','Scrambler v.34','NumberTitle','off');

%---------------------------Pierwszy przypadek - na wejsciu same zera-----------------
data = zeros(1, N);

% Scrambler DVB
figure(fig1);
scrambled_data = Scramble_DVB(data, register_DVB); % Przeprowadz skrablowanie na danych w standardzie DVB
descrambled_data = Descramble_DVB(scrambled_data, register_DVB); % Przeprowadz deskrablowanie na danych w standardzie DVB
%display(scrambled_data);
%display(descrambled_data);

subplot(311)
histData = BitSequence(scrambled_data); % Zamien otrzymane dane na postac umozliwiajaca wygenerowanie histogramu
hist(histData,length(histData)); % Wygeneruj histogram
title('Na wejsciu same zera');
xlabel('Liczba kolejnych takich samych bitow');
ylabel('Liczba  przypadkow');

% Scrambler v.34
figure(fig2);
scrambled_data = Scramble_V34(data, register_V34); % Przeprowadz skrablowanie na danych w standardzie v.34
descrambled_data = Descramble_V34(scrambled_data, register_V34); % Przeprowadz deskrablowanie na danych w standardzie v.34
%display(scrambled_data);
%display(descrambled_data);

subplot(311)
histData = BitSequence(scrambled_data); % Zamien otrzymane dane na postac umozliwiajaca wygenerowanie histogramu
hist(histData,length(histData)); % Wygeneruj histogram
title('Na wejsciu same zera');
xlabel('Liczba kolejnych takich samych bitow');
ylabel('Liczba  przypadkow');

%---------------------------Drugi przypadek - na wejsciu same jedynki-----------------
data = ones(1, N);

% Scrambler DVB
figure(fig1);
scrambled_data = Scramble_DVB(data, register_DVB);
descrambled_data = Descramble_DVB(scrambled_data, register_DVB);
%display(scrambled_data);
%display(descrambled_data);

subplot(312)
histData = BitSequence(scrambled_data);
hist(histData,length(histData));
title('Na wejsciu same jedynki');
xlabel('Liczba kolejnych takich samych bitow');
ylabel('Liczba  przypadkow');

% Scrambler v.34
figure(fig2);
scrambled_data = Scramble_V34(data, register_V34);
descrambled_data = Descramble_V34(scrambled_data, register_V34);
%display(scrambled_data);
%display(descrambled_data);

subplot(312)
histData = BitSequence(scrambled_data);
hist(histData,length(histData));
title('Na wejsciu same jedynki');
xlabel('Liczba kolejnych takich samych bitow');
ylabel('Liczba  przypadkow');

%---------------------------Trzeci przypadek - losowe dane na wejsciu-----------------
%Generator ciagu bitow o zadanej dlugosci
for i = 1:N 
  temp = rand();
  if temp > 0.5 %Przyjmujemy, ze dla wartosci powyzej 0.5, bit bedzie mial wartosc 1
    data(i) = 1;
  else          %Przyjmujemy, ze dla wartosci ponizej 0.5, bit bedzie mial wartosc 0
    data(i) = 0;
  end
endfor

% Scrambler DVB
figure(fig1);
scrambled_data = Scramble_DVB(data, register_DVB);
descrambled_data = Descramble_DVB(scrambled_data, register_DVB);
%display(scrambled_data);
%display(descrambled_data);

subplot(313)
histData = BitSequence(scrambled_data);
hist(histData,length(histData));
title('Losowe dane na wejsciu');
xlabel('Liczba kolejnych takich samych bitow');
ylabel('Liczba  przypadkow');

% Scrambler v.34
figure(fig2);
scrambled_data = Scramble_V34(data, register_V34);
descrambled_data = Descramble_V34(scrambled_data, register_V34);
%display(scrambled_data);
%display(descrambled_data);

subplot(313)
histData = BitSequence(scrambled_data);
hist(histData,length(histData));
title('Losowe dane na wejsciu');
xlabel('Liczba kolejnych takich samych bitow');
ylabel('Liczba  przypadkow');
