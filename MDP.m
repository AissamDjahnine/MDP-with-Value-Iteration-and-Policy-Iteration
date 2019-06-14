clear all, close all, clc,

%% Scenario :
% Grid dimensions 
RowMax = 3; % number of rows
ColMax = 4; % number of columns 
nbr = RowMax*ColMax; % number of cases/nodes

% creation of the grid
Plan = ones(RowMax,ColMax);

% Association of a number to each case
Map_plan2node = reshape((1:nbr),RowMax,ColMax);

% obstacles : 
Plan(2,2) = -1;

% Display of system ( grid )
figure(1), imagesc(Plan), colormap hot, colorbar, axis square, grid on, title('System');


%% Rewards :

R = -0.04*ones(RowMax,ColMax); % standard cases
R(1,4) = 1; % goal case 
R(2,4) = -1; % danger case 

%% Display Rewards :
DisplayReward(R,Map_plan2node);

%% Stats transition function :

%% Possible actions :
N = 1; W = 2; S = 3; E = 4;
A = [N,W,S,E];

%% The probability of each possible action :
forward = 0.8; right = 0.1; left = 0.1; back = 0;

%% Transition stats function :
T = zeros(nbr ,length(A) , nbr); % T(s,a,s') 

for i=1:nbr % for each case
    
    [RowPos,ColPos] = find(Map_plan2node==i); % position of the case in the grid
    
    if Plan(RowPos,ColPos)==1  % if the case is not the obstacle 
        
        % Grid borders cases : 
        ligneHaut = -1; ligneBas = 1;colGauche = -1; colDroite = 1;
        if RowPos == 1 ;
            ligneHaut = 0;  % No neighbour above 
        end
        if RowPos == RowMax;
            ligneBas = 0;   % No neighbout below 
        end
        if ColPos == 1;
            colGauche = 0;  % No left neighbour
        end 
        if ColPos == ColMax
            colDroite = 0;  % No right neighbour
        end
        
        % Neighbours Number ( index ) : 
        Neighbours(1) = Map_plan2node(RowPos+ligneHaut,ColPos); % N
        Neighbours(2) = Map_plan2node(RowPos,ColPos+colGauche); % W
        Neighbours(3) = Map_plan2node(RowPos+ligneBas,ColPos);  % S
        Neighbours(4) = Map_plan2node(RowPos,ColPos+colDroite); % E
        
        % Looking for the obstacle in neighbours : 
        DirObst=find(Plan(Neighbours)==-1);     % Neighbours that are obstacles
        Neighbours(DirObst)=i;                  % The robot don't move in case of abstacle
        
        %% The probability of each possible action :
        % action : N
        T(i,A(1),Neighbours(1)) = T(i,A(1),Neighbours(1))+forward;
        T(i,A(1),Neighbours(2)) = T(i,A(1),Neighbours(2))+left;
        T(i,A(1),Neighbours(3)) = T(i,A(1),Neighbours(3))+back;
        T(i,A(1),Neighbours(4)) = T(i,A(1),Neighbours(4))+right;
        % action : W
        T(i,A(2),Neighbours(1)) = T(i,A(2),Neighbours(1))+left;
        T(i,A(2),Neighbours(2)) = T(i,A(2),Neighbours(2))+forward;
        T(i,A(2),Neighbours(3)) = T(i,A(2),Neighbours(3))+right;
        T(i,A(2),Neighbours(4)) = T(i,A(2),Neighbours(4))+back;
        % action : S
        T(i,A(3),Neighbours(1)) = T(i,A(3),Neighbours(1))+back;
        T(i,A(3),Neighbours(2)) = T(i,A(3),Neighbours(2))+right;
        T(i,A(3),Neighbours(3)) = T(i,A(3),Neighbours(3))+forward;
        T(i,A(3),Neighbours(4)) = T(i,A(3),Neighbours(4))+left;
        % action : E
        T(i,A(4),Neighbours(1)) = T(i,A(4),Neighbours(1))+right;
        T(i,A(4),Neighbours(2)) = T(i,A(4),Neighbours(2))+back;
        T(i,A(4),Neighbours(3)) = T(i,A(4),Neighbours(3))+left;
        T(i,A(4),Neighbours(4)) = T(i,A(4),Neighbours(4))+forward;
        
    elseif Plan(RowPos,ColPos)==0 % if the case is goal 
        T(i,A,:)=0;
    else  % if case if an obstacle 
        T(i,A,:)=0;
    end
    
end

Gamma=1;                        % Escompte factor
precision=10e-5;                % Precision

[Politique_ValueIteration]=ValueIteration(Plan,Map_plan2node,S,T,A,R,Gamma,precision,RowMax,ColMax)
h=msgbox('Value iteration is Finished , tap OK to exit ')
uiwait(h,5);
if ishandle(h) == 1
    delete(h);
end

