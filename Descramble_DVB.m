%---------------------------------Descrambler_DVB------------------------------------%
function [descrambled_data] = Descramble_DVB(scrambled_data, register)

  for i = 1:length(scrambled_data)
     
       %Pierwsza bramka xor
       result = xor(register(length(register)),register(length(register) - 1)); 
       %Przesuwanie elementów rejestru
       for j = 2:length(register)
         register(length(register) + 2 - j) = register(length(register) + 1 - j);
       endfor
       register(1) = result;
       %Druga bramka xor
       descrambled_data(i) = xor(result, scrambled_data(i)) ;
       
  endfor
endfunction
