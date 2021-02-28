function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
        
        val = vec(2);
        
        for j = 1 : vec(2)
            if vec(j + 2) == i
                val--;
            endif
        endfor
        
        for j = 1 : vec(2)  
            % pun valorile de 1 / L(pj) in mat
            if vec(j + 2) == i
                mat(i, vec(j + 2)) = 0;
            else 
                mat(i, vec(j + 2)) = 1 / val;
            endif
        endfor
        
    endfor
 
    prev(1 : N, 1) = double(1 / N);
    
    mat = mat';
    
    % descompun matricea G
    G = eye(N) - d .* mat;
    [Q, R_g] = GrammSchmidt(G);
    
    b = ((1 - d) / N) .* ones(N, 1); 
    
    % calculez R
    R = SST(R_g, Q' * b);
        
endfunction