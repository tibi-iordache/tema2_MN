Iordache Tiberiu-Mihai 312CD

Functii Aditionale:

-GrammSchmidt.m:
	Am implementat algoritmul prezentat la laborator. Iau fiecare linie
din matrice, calculez suma proiectiilor, o scad din linie, normez, 
dupa care adaug acest vector in Q. In final, R va fi dat de inv(Q)*A.

-SST.m:
	Aceasta functie imi rezolva un sistem, este facuta sa functioneze pe
orice tip de matrice, nu neaparat patratica. Imi rezolva sistemul de 
ecuatii de jos in sus pe baza solutiilor x(i) gasite la fiecare pas.

Cerinte:

-Iterative.m:
	La aceasta functie am folosit dlmread pt a citi datele din fisier, 
acestea trebuiind prelucrate deoarece apareau 0 uri inutile in citire.
Am salvat N, dupa care am calculat matricea M care va fi folosita 
ulterior cand calculez R. Am initializat solutia cu 1/N astfel fiecare
pagina are linkuri distribuite uniform initial, dupa care am urmarit 
algorithmul de pe pagina de wiki pt a calcula noul R. Daca dif dintre
R si prev era destul de mica, salvam prev, astfel incat acest algoritm
imi returna vectorul solutie cu o iteratie in plus(am reusit sa 
rezolv aceasta problema datoria indicatiilor de pe forum).

-Algebraic.m:
	Formez aceeasi matrice ca la functiia anteriora, dar pt a calcula
R descompun matricea G in Q si R_g, dupa care rezolv sistemul
Q*R_g*R = b <=> R_g*R = Q'*b folosind SST.

-Apartenenta.m:
	Imi calculeaza valoare y a functiei cu cele 3 ramuri in functie 
de intervalul dat.

-PageRank:
	Salvez N, val1 si val2, dupa care creez fisierul de out.
Calculez vectorii R prin fiecare metoda dupa care sortez vectorul
R2, si calculez F pt fiecare valoare a sa, formand astfel pagerank ul.