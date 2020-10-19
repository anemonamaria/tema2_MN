function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  y = 0;%initializam de la inceput y=0
	 if x > val2
    y = 1;
  elseif val1 != val2
      y = 1/(val2 - val1)*x + -val1/(val2-val1);
   endif
endfunction
