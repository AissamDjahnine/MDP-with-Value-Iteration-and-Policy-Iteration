function DisplayUtilities(U,Map_plan2node,iteration)

% Inputs :
% - U             : utilities vector for each case of the grid
% - Map_plan2node : Correspondance matrix between the number of the case and its position in the grid
% - iteration     : iteration counter of the algorithm ( for the display )

figure(2),imagesc(U), colormap jet, colorbar, axis square, grid on,
for i = 1:length(U(:))
    [RowPos,ColPos] = find(Map_plan2node==i);
    text(ColPos-0.1,RowPos,num2str(U(RowPos,ColPos)),'FontSize',10,'Color',[0,0,0]);
end
title(['Utilities : iteration',num2str(iteration)]),colorbar;