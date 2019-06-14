function [Politique]=ItterationValeur(Plan,Map_plan2node,S,T,A,R,Gamma,precision,RowMax,ColMax)
FixedNodes=[5,10,11]; % Cases which the utilities value is unchanged in the algorithm
nbr= RowMax*ColMax;   % Number of total case of the system  

% initialization of the utilities U0
U = R;
% Utilities display ( initial values ) 
DisplayUtilities(reshape(U,RowMax,ColMax),Map_plan2node,0);

% Escompte value 0 < Gamma < 1
escompte = Gamma;
 
% Structure to save possible neighbours for each action
PossibleCases = cell(1,length(A)); 

% Vector to save utilities gain associated with each action 
GainU = zeros(1,length(A));
% Reshaping the Utilites values in a 1 x 12 vector
Uj= reshape(U,1,nbr);         
% Vector Uj1 to save the utilities values for each iteration (Uj+1) :
Uj1 = Uj;           
R_init = reshape(R,1,nbr);    % Reshaping the Rewards values in a 1 x 12 vector
j=1;                          % Iteration index 
NbrMaxIterations=100;         % Max number of iterations ( infinite horizon )
 
while j < NbrMaxIterations    
    for i=1:length(R_init)
        %i~=5 & i~=10 & i~=11) %we don't change these values ( 5:obstacle,10(goal),11(danger) )
        if ( ismember(i,FixedNodes)==0 ) 
            [PossibleCases]= NeighboursSearch(Plan,Map_plan2node,i,RowMax,ColMax); %find the 4 possible neighbours for each case
            if( PossibleCases(1) ~= 0 )
                for k=1:length( PossibleCases )      %for each possible neighbours of U(i) 
                    gain_temp=0;                     %Variable to compute the gain for each action                           
                    if( k==1 )      %Action N ( 1 ) : Possible actions ( Nord,West,Est )
                        vect=[PossibleCases(1) PossibleCases(2) PossibleCases(4)];
                    elseif (k==2)   %Action W ( 2 ) : Possible actions ( West,Nord,Sud )
                        vect=[PossibleCases(1) PossibleCases(2) PossibleCases(3)];
                    elseif (k==3)   %Action S ( 3 ) : Possible action ( West,Sud,Est )
                         vect=[PossibleCases(2) PossibleCases(3) PossibleCases(4)];
                    else            %Action E ( 4 ) : Actions Possibles (Nord,Sud,Est )
                         vect=[PossibleCases(1) PossibleCases(3) PossibleCases(4)];
                    end
                    vect=unique(vect,'stable'); %Eliminate the cases that show up twice for each action 
                    for m=1:length(vect)
                        gain_temp = gain_temp + T( i , k , vect(m) ) * Uj1( vect(m) ); %Compute the Gain vector for the possible actions   
                    end
                    GainU(k) = gain_temp;  %Compute Gain vector for Action K 
                end
                Uj1(i) = R_init(i) + Gamma * max( GainU ); %Compute the new utilities values
            end   
        % Display of the evolution of utilities ( for each iteration )
          DisplayUtilities(reshape(Uj1,RowMax,ColMax),Map_plan2node,j),pause(0.00000005);
        end
    end
    j=j+1; 
    % Convergence condition
    % Compute the quadratic error of the utilities
    RMS=0; 
    for l=1:length(nbr)
          RMS= RMS + ( Uj1(l) - Uj(l))^2;        
    end
    RMS = sqrt(RMS)/nbr;
    if RMS < precision
        break  % Stop of iteratif computing
    end 
    Uj = Uj1;  % update utilites values 
end
%%%%%%%%%%%%%%%%%%%% Computing the optimal Politique  %%%%%%%%%%%%%%%%%%%%%%%%%%%

Uf = Uj1; % taking the last values of utilities 
for i=1:length(Uf) 
   if ( ismember(i,FixedNodes)== 0 ) 
       [PossibleCases] = ChercherVoisins(Plan,Map_plan2node,i,RowMax,ColMax); %find the 4 possible neighbours for each case
       if(PossibleCases(1)~=0)
           if( PossibleCases(1) ~= 0 )
                for k=1:length( PossibleCases )      %for each possible neighbours of U(i) 
                    gain_temp=0;        %Variable Poour calculer le gain,pour chaque action
                        if     ( k==1 )
                                vect=[PossibleCases(1) PossibleCases(2) PossibleCases(4)];
                        elseif (k==2)
                                vect=[PossibleCases(1) PossibleCases(2) PossibleCases(3)];
                        elseif (k==3)
                                vect=[PossibleCases(2) PossibleCases(3) PossibleCases(4)];
                        else
                                vect=[PossibleCases(1) PossibleCases(3) PossibleCases(4)];
                        end
                        vect=unique(vect,'stable');
                        
                        for m=1:length(vect)
                            gain_temp = gain_temp + T( i , k , vect(m) ) * Uf( vect(m) );
                        end
                    GainU(k) = gain_temp;
                end
                I=find(GainU==max(GainU));  %Find the argmax ( find the action to take )
           end
           Politique(i)=I(1);
       end       
   else
       Politique(i)=0;  % For cases ( 5,10,11 )
   end    
end
disp('[ Optimal Politique ( Value iteration ) ) ')
%Display politique
DisplayUtilities(reshape(Uf,RowMax,ColMax),Map_plan2node,j);
DisplayPolitique(Politique,Plan,Map_plan2node); , title(['[ Optimal politique ] Value iteration']);
end
