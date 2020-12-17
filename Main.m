%---------------------------Dane pocz¹tkowe-------------------------------------------
register =  [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0];% inicjalizacja rejestru
N = 50; %iloœæ bitów wejœciowych

%---------------------------Pierwszy przypadek - na wejœciu same zera-----------------
data = zeros(1, N);

scrambled_data1 = Scramble(data, register);
descrambled_data1 = Descramble(scrambled_data1, register);
display(scrambled_data1);
display(descrambled_data1);

%---------------------------Drugi przypadek - na wejœciu same jedynki-----------------
data = ones(1,N)

scrambled_data2 = Scramble(data, register);
descrambled_data2 = Descramble(scrambled_data2, register);
display(scrambled_data2);
display(descrambled_data2);

%---------------------------Trzeci przypadek - losowy ci¹g bitów-----------------------
%Generator ci¹gu bitów o zadanej d³ugoœci
for i = 1:N 
  temp = rand();
  if temp > 0.5 %Przyjmujemy, ¿e dla waroœci powy¿ej 0.5 bit bêdzie mia³ wartoœæ 1
    data(i) = 1;
  else          %Przyjmujemy, ¿e dla waroœci poni¿ej 0.5 bit bêdzie mia³ wartoœæ 0
    data(i) = 0;
  end
endfor

scrambled_data3 = Scramble(data, register);
descrambled_data3 = Descramble(scrambled_data3, register);
display(data);
display(scrambled_data3);
display(descrambled_data3);