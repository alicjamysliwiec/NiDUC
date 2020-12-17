%---------------------------Dane pocz�tkowe-------------------------------------------
register =  [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0];% inicjalizacja rejestru
N = 50; %ilo�� bit�w wej�ciowych

%---------------------------Pierwszy przypadek - na wej�ciu same zera-----------------
data = zeros(1, N);

scrambled_data1 = Scramble(data, register);
descrambled_data1 = Descramble(scrambled_data1, register);
display(scrambled_data1);
display(descrambled_data1);

%---------------------------Drugi przypadek - na wej�ciu same jedynki-----------------
data = ones(1,N)

scrambled_data2 = Scramble(data, register);
descrambled_data2 = Descramble(scrambled_data2, register);
display(scrambled_data2);
display(descrambled_data2);

%---------------------------Trzeci przypadek - losowy ci�g bit�w-----------------------
%Generator ci�gu bit�w o zadanej d�ugo�ci
for i = 1:N 
  temp = rand();
  if temp > 0.5 %Przyjmujemy, �e dla waro�ci powy�ej 0.5 bit b�dzie mia� warto�� 1
    data(i) = 1;
  else          %Przyjmujemy, �e dla waro�ci poni�ej 0.5 bit b�dzie mia� warto�� 0
    data(i) = 0;
  end
endfor

scrambled_data3 = Scramble(data, register);
descrambled_data3 = Descramble(scrambled_data3, register);
display(data);
display(scrambled_data3);
display(descrambled_data3);