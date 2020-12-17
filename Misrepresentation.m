%---------------------------------Wytworzenie przekłamania z prawdopodobieństwem P-------------------------------------
function [final_data] = Misrepresentation (orignal_data, p)
  for i = 1:length(orignal_data) 
    temp = rand();
    if temp <= p % Przyjmujemy, ze dla wartosci mniejszej/rownej od 'p', bit przyjmie wartosc przeciwna
      final_data(i) = !orignal_data(i);
    else          % Przyjmujemy, ze dla wartosci powyzej 'p', wartosc bitu nie ulegnie zmianie
      final_data(i) = orignal_data(i);
    end
  endfor
endfunction
