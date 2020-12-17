clear;
%---------------------------Symulacja z przeklamaniem na pojedynczym bicie-----------------------%
N = 1000; % Ilosc bitow wejsciowych
wrong_bit_index = 100;
register_DVB = [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0]; % Inicjalizacja rejestru dla DVB
register_V34 = [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0]; % Inicjalizacja rejestru dla v.34

%---------------------------Losowe dane na wejsciu-----------------
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
scrambled_data = Scramble_DVB(data, register_DVB); % Przeprowadz skrablowanie na danych w standardzie DVB
transmitted_data = scrambled_data;
transmitted_data(wrong_bit_index) = !transmitted_data(wrong_bit_index); % Zasymuluj wystapienie przeklamania na pojedynczym bicie
descrambled_data = Descramble_DVB(transmitted_data, register_DVB); % Przeprowadz deskramblowanie danych, ktore przeszly przez kanal transmisyjnych
BER = numel(find(descrambled_data!=data))/N; % Oblicz wartosc wskaznika BER
display(BER);
display(scrambled_data);
display(descrambled_data);

% Scrambler v.34
scrambled_data = Scramble_V34(data, register_V34); % Przeprowadz skrablowanie na danych w standardzie v.34
transmitted_data = scrambled_data;
transmitted_data(wrong_bit_index) = !transmitted_data(wrong_bit_index); % Zasymuluj wystapienie przeklamania na pojedynczym bicie
descrambled_data = Descramble_V34(transmitted_data, register_V34); % Przeprowadz deskramblowanie danych, ktore przeszly przez kanal transmisyjnych
BER = numel(find(descrambled_data!=data))/N; % Oblicz wartosc wskaznika BER
display(BER);
display(scrambled_data);
display(descrambled_data);

