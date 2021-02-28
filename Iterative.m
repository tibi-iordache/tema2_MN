function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
    
    % citesc datele
    a = dlmread(nume);
    
    % separ N
    N = a(1,1);
    
    % initializez matricea
    mat = zeros(N, N);
    
    % parcurg 
    for i = 1 : N
        % iau fiecare linie
        vec = a(i + 1, :);
        % scot zerourile de la citire
        vec = vec(vec ~= 0);
        
        % verific daca o pagina are legatura catre ea insasi
        val = vec(2);
        
        for j = 1 : vec(2)
            if vec(j + 2) == i
                % daca are, scad nr de legaturi
                val--;
            endif
        endfor
        
        for j = 1 : vec(2)  
            % pun valorile de 1 / L(pj) in mat
            if vec(j + 2) == i
                % daca are legatura catre ea insasi, pun 0
                mat(i, vec(j + 2)) = 0;
            else 
                mat(i, vec(j + 2)) = 1 / val;
            endif
        endfor
        
    endfor
    
    % initializez solutia
    prev(1 : N, 1) = 1 / N;
    
    mat = mat';
    
    while 1 
        % calculez noul R
        R = mat * prev .* d + ones(N, 1) .* ( (1 - d) / N );

        % calculez eroarea
        err = norm(R - prev);
        
        if err < eps
            % iau penultima iteratie
            R = prev;
            break;
        endif
        
        % salvez R
        prev = R;
    endwhile
endfunction