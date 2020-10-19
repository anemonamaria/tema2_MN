function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  f = fopen(nume, 'r');%deschidem fisierul 
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
         P(i,i)++; %link-urile pe care le are o pagina
      endif
    endfor
  endfor     
  P=inv(P);
	Q = (P*X);
	U = zeros(nr,1);
  for i = 1 : nr
    U(i,1) = 1/nr;
  endfor
	R = zeros(nr,1);
  x = norm(U);
  L = ones(nr,1);
	while ( x >= eps)
		R = U;
		U = d*Q'*U + (1-d)/nr*L; % algoritmul iterative
    x = norm(U-R);
	endwhile
  fclose(f);
endfunction
