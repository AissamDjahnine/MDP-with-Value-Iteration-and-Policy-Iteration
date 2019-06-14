function AfficheRecompences(R,Map_plan2node)

% Inputs :
% - R             : Rewards matrix for each grid case
% - Map_plan2node : Correspondance matrix between case number and case position in the grid 

figure(2), imagesc(R), colormap jet, colorbar, axis square, grid on, title('Récompenses');
for i = 1:length(R(:))
    [RowPos,ColPos] = find(Map_plan2node==i);
    text(ColPos-0.1,RowPos,num2str(R(RowPos,ColPos)),'FontSize',15,'Color',[0,0,0]);
end
title('Rewards'),colorbar;
