%---------------------------------Descrambler_V34------------------------------------%
function descrambled_data = Descramble_V34(scrambled_data, register)
  for i = 1:length(scrambled_data)
    % Wykonaj operacje: out = (in XOR (reg[18] XOR reg[23])
    result = xor(register(18), register(23));
    result = xor(scrambled_data(i), result);
    % Przesuniecie rejestru w prawo o 1 bit (przy czym ostatni bit w wektorze staje sie pierwszym)
    register = circshift(register, 1);
    % Po przesunięciu zastap pierwszy bit rejestru kolejnym bitem wektora wejsciowego
    register(1) = scrambled_data(i);
    % Zapisz wynik operacji do wektora wyjsciowego
    descrambled_data(i) = result;
  endfor
  
endfunction
