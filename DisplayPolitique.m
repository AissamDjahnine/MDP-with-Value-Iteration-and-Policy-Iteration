function AffichePolitique(Politique,Plan,Map_plan2node)

% Inputs :
% - Politique     : Vector of action of each case of the grid 
% - Plan          : Plan matrix ( main program )
% - Map_plan2node : Correspondance matrix between number of the case and its position of the grid

figure(3),imagesc(Plan), colormap gray, colorbar, axis square, grid on,
for i = 1:length(Politique(:))
    [RowPos,ColPos] = find(Map_plan2node==i);
    if Politique(i) == 1
        text(ColPos-0.1,RowPos,'\uparrow','FontSize',15);
    elseif Politique(i) == 2
        text(ColPos-0.1,RowPos,'\leftarrow','FontSize',15);
    elseif Politique(i) == 3
        text(ColPos-0.1,RowPos,'\downarrow','FontSize',15);
    elseif Politique(i) == 4
        text(ColPos-0.1,RowPos,'\rightarrow','FontSize',15);
    else
        text(ColPos-0.1,RowPos,'o','FontSize',15,'Color',[0.5,0.5,0.5]);
    end
end
title('[ Optimal Politique ]'),colorbar;