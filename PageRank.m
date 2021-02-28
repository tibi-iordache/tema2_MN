function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
    m = dlmread(nume);
    
    % separ N
    N = m(1,1);
    
    % separ valoriile
    val_1 = m(1 + N + 1, 1);
    val_2 = m(1 + N + 2, 1);
    
    % formez fisierul de out
    filename = strcat(nume, ".out");
    fid = fopen(filename, "w");
    
    %afisez N
    fprintf(fid, "%d", N);
    fprintf(fid, "\n\n");
    
    % calculez R cu prima metoda
    R_it = Iterative(nume, d, eps);
    R1 = R_it;
    
    % afisez
    fprintf(fid, "%f\n", R_it);
    fprintf(fid, "\n");
    
    % calculez R cu a doua metoda
    R_al = Algebraic(nume, d);
    R2 = R_al;
    
    % afisez
    fprintf(fid, "%f\n", R_al);
    fprintf(fid, "\n");
    
    % sortez
    PR1 = sort(R_al, 'descend');
    
    % parcurg fiecare valoare
    for i = 1 : N
        % afisez i
        fprintf(fid, "%d ", i);
        
        % caut j (pozitia elem din PR1 in R_al)
        
        % vector de nr de la 1 pana la N
        poz_help = [1:N];
        % pozitia unde se gaseste elementul relativ la poz_help
        poz = poz_help(R_al == PR1(i));
        
        % afisez j
        fprintf(fid, "%d ", poz);
        
        % calculez F si afisez
        F = Apartenenta(PR1(i), val_1, val_2);
        fprintf(fid, "%f\n", F);
    endfor    
    
    % inchid fisierul
    fclose(fid);
    
endfunction