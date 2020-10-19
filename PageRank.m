function [R1 R2] = PageRank(nume, d, eps)
  %d=0.85
  %eps = 0.001
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  [f1, contiunt]=fopen(nume,"r");%deschidem fisierul dat din input
  nr=str2num(fgetl(f1));
  for i=1 : nr
    line = fgetl(f1);
  endfor
  p1=fgetl(f1);%citim ce se afla pe prima linie din fisier si convertim in int
  pag1=str2num(p1);%retin numarul de pagini
  p2=fgetl(f1);
  pag2=str2num(p2);%retin numarul de pagini
  A=zeros(nr,1);%initializam matricele de care avem nevoie
  B=zeros(nr,1);
  C=zeros(nr,1);
  R1=Iterative(nume, d, eps);
  R2=Algebraic(nume, d);
  X(:,1)=Apartenenta(R2(:,1),pag1,pag2);
  for i = 1 : nr
    A(i,1)=i; %indicii paginilor
    B(i,1)=X(i,1);
    C(i,1)=R2(i,1);
  endfor
    R=zeros(nr,3);
    for i = 1:nr %cream matricea R de care ne vom ajuta 
      R(i,1)=A(i,1);
      R(i,2)=B(i,1);
      R(i,3)=C(i,1);
    endfor
  R=sortrows(R,[2 3 1]); %ordonam crescator dupa a doua coloana matricea creata (a2a coloana este cea care contine 
                          %valorile date de Apartenenta
  sum = 0;
  for i = 1 : nr
    for j = 1 : 3
      sum = sum + R(i,j);
    endfor
    sum = 0;
  endfor
  R3=zeros(nr,3);
  for i = 1 : nr 
    R3(i, :) = R(nr-i+1,:);%interschimbam valorile in R pentru a ne facilita printarea
  endfor
  new=strcat(nume,".out");
  [f2, continut]=fopen(new,"w");%facem un fisier in care vom scrie rezultatele
  for i = 1:nr
    for j = 1:3
      if R3(i,j) < 0.000000%in cazul in care exista numere negative le initializam cu zero 
        R3(i,j) = 0.000000;%pentru ca nu este posibil ca rezultatele sa fie negative 
      endif
    endfor
  endfor
  for i = 0 : nr%printarea solutiilor in fisier
    if i == 0
      fprintf(f2,"%d\n", nr);
    else
      fprintf(f2,"%.6f\n",R1(i,1));
  endif
    endfor
  for i = 0 : nr
    if i == 0
      fprintf(f2,"\n");
    else
      fprintf(f2,"%.6f\n",R2(i,1));
    endif  
  endfor
  for i= 1: nr
    fprintf(f2,"\n");
    fprintf(f2,"%d %d %.6f",i,R3(i,1),R3(i,2));
  endfor
  fclose(f1);%%inchidem fisierele folosite in program
  fclose(f2);
endfunction
