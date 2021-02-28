function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
    
    % verific fiecare caz in parte
    if (x >= 0) && (x < val1)
        % pun valoarea corespunzatoare
        y  = 0;
    elseif (x > val2) && (x <= 1)
        % pun valoarea corespunzatoare
        y = 1;
    else    
        % pt ca u(x) sa fie continua:
        % a = (1 / (val2 - val1))
        % b = val1 / (val1 - val2)
        
        % pun valoarea corespunzatoare
        y = x * (1 / (val2 - val1)) + val1 / (val1 - val2);
    endif
    
endfunction
	