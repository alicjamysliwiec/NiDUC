%---------------------------------Scrambler_V34-------------------------------------%
function scrambled_data = Scramble_V34(data, register)
  for i = 1:length(data)
    % Wykonaj operacje: out = (in XOR (reg[18] XOR reg[23])
    result = xor(register(18), register(23));
    result = xor(data(i), result);
    % Przesuniecie rejestru w prawo o 1 bit (przy czym ostatni bit w wektorze staje sie pierwszym)
    register = circshift(register, 1);
    % Po przesunieciu zastap pierwszy bit rejestru wynikiem operacji
    register(1) = result;
    % Zapisz wynik operacji do wektora wyjsciowego
    scrambled_data(i) = result;
  endfor
  
endfunction
