function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare 
	[m n]=size(A);
  Q = (eye(m)-A);
	R = zeros( m, n );
	for k = 1 : n
    R( k, k ) = norm( Q( 1 : m, k ) );
	  Q( 1 : m, k ) = Q( 1 : m, k ) / R( k, k );
	  for j = k + 1 : n
		  R( k, j ) = Q( 1 : m, k )' * Q( 1 : m, j );
		  Q( 1 : m, j ) = Q(1 : m, j ) - Q( 1 : m, k ) * R( k, j );
	   endfor
	endfor
	I = eye(n);
	for i = 1:n
		B(:,i) = SST(R,Q'*I(:,i));
	endfor
  I = ones(m,1);
  B=B*I;
endfunction
