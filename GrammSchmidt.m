function [Q, R] = GrammSchmidt(A)
    [m n] = size(A);
    
    % initializez
    Q = zeros(m);
    R = zeros(n);
    U = zeros(m);
    e = zeros(m);
    
    % calculez prima coloana din Q
    U(:, 1) = A(:, 1);
    e(:, 1) = U(:, 1) ./ norm(U(:, 1));
    Q(:, 1) = e(:, 1);
    
    for i = 2 : n
        sum = 0;
        
        for j = 1 : i - 1
            % calculez proiectia
            proj = A(:, i)' * e(:, j);
            
            % o adaug la suma
            sum = sum + e(:, j) .* proj;
        endfor
        
        % calculez coloana i din Q
        U(:, i) = A(:, i) - sum;
        e(:, i) = U(:, i) ./ norm(U(:, i));
        Q(:, i) = e(:, i);
    endfor
    
    % calculez R
    R = Q' * A;
endfunction