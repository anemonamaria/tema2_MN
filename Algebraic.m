function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  f = fopen(nume, 'r');%deschidem fisierul din care vom citi valorile
  a=fgetl(f);%citim ce se afla pe prima linie din fisier si convertim in int
  nr=str2num(a);%retinem numarul de pagini
	X = P = zeros(nr,nr);%initializam matricele
	for i = 1:nr
    n = fscanf(f,'%d',1); % nr pagini
    o = fscanf(f,'%d',1); % nr link-uri
		for j = 1: o
      val = fscanf(f,'%d',1); 
			X(i,val) = 1;%introduc in matricea de adiacenta
    endfor
    X(i,i) = 0;% nu conteaza daca o pagina are link catre ea
	endfor
  for i = 1:nr
    for j = 1:nr
      if X(i,j) == 1
         P(i,i)++;%link-urile pe care le are o pagina
      endif
    endfor
  endfor     
  P=inv(P);
	Q = d*(P*X)';
	B = PR_Inv(Q);%ne folosim de algoritmul GS pentru inversa matricei
  k = (1-d)/nr;
	R = B*k;
  fclose(f);
endfunction
