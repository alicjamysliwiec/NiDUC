%---------------------------------Badanie ilosci utrat synchronizacji-------------------------------------
function synchronized_bits = Synchronization (data, k, I)
  counter = 0; % Licznik wystapien po sobie bitow '0'
  synchronized_bits = 0; % Bity odebrane przy prawidlowej synchronizacji
  i = 1; % Indeks kolejnego bitu danych
  while i < length(data)
    if data(i) == 0 % Sprawdz czy dany bit jest rowny '0'
      counter = counter + 1; % Jezeli tak to inkrementuj licznik wystepujacych po sobie '0'
    else
      counter = 0; % W przeciwnym wypadku zeruj licznik
    endif
     
    if counter == k % Jezeli licznik jest rowny liczbie bitow zerowcyh potrzebnych do desynchronizacji
      counter = 0; % Zeruj licznik
      i = i + I; % Pomin nastepne I bitow
      continue; % Pomin dalsza czesc petli
    endif
    
    synchronized_bits = synchronized_bits + 1; % Zwieksz licznik bitow odebranych przy prawidlowej synchronizacji
    i = i + 1; % Przejdz do nastepnego indeksu bitu danych
  endwhile
endfunction
