%-------Funckja pozwalaj�ca obliczy� d�ugo�� takich samych sekwencji bit�w------
function [bitSequence] = BitSequence (data)
  
  bitSequence(1) = 1; %tablica, w ktorej zaisujemy kolejne dlugosci cigow bitow
  j = 1;              %idneks tablicy
  for i = 2:length(data)
    if data(i) == data(i-1);%jezeli bity sie powtarzaja to zwiekszamy wartosc w tablicy 
      bitSequence(j)++;
    else 
      j++; %w przeciwnym wypadku przechodzimy do kolejnego indeksu
      bitSequence(j) = 1; %przypisujemy wartosc poczatkowa
     endif
  endfor

endfunction
