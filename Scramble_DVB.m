%---------------------------------Scrambler_DVB-------------------------------------
function [scrambled_data] = Scramble_DVB(data, register)

  for i = 1:length(data)
    
       %Pierwsza bramka xor     
       result = xor(register(length(register)),register(length(register) - 1)); 
       %Przesuwanie elementów rejestru       
       for j = 2:length(register)
         register(length(register) + 2 - j) = register(length(register) + 1 - j);
       endfor
       register(1) = result;
       %Druga bramka xor       
       scrambled_data(i) = xor(result, data(i)) ;
       
  endfor
  
endfunction
