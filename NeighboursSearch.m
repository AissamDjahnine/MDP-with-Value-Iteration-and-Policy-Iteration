function[Voisins]=ChercherVoisins(Plan,Map_plan2node ,S,RowMax,ColMax, a )
    Voisins=zeros(1,4);
    [RowPos,ColPos] = find(Map_plan2node==S); % position of the case in the grid 
    
    if Plan(RowPos,ColPos)==1  % if the case is not the obstacle 
        
        % Grid borders cases : 
        ligneHaut = -1; ligneBas = 1;colGauche = -1; colDroite = 1;
        if RowPos == 1 ;
            ligneHaut = 0; % No neighbour above 
        end
        if RowPos == RowMax;
            ligneBas = 0;  % No neighbout below
        end
        if ColPos == 1;
            colGauche = 0;  % No left neighbour
        end
        if ColPos == ColMax
            colDroite = 0;  % No right neighbour
        end
        
        % Neighbours Number ( index ) : 
        Voisins(1) = Map_plan2node(RowPos+ligneHaut,ColPos); % N
        Voisins(2) = Map_plan2node(RowPos,ColPos+colGauche); % W
        Voisins(3) = Map_plan2node(RowPos+ligneBas,ColPos);  % S
        Voisins(4) = Map_plan2node(RowPos,ColPos+colDroite); % E
        
        % Looking for the obstacle in neighbours : 
        DirObst=find(Plan(Voisins)==-1); % Neighbours that are obstacles
        Voisins(DirObst)=S;  % The robot don't move in case of abstacle
    end
end
        