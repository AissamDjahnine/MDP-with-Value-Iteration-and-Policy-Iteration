##  markov-decision-process<img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./Matlab_Logo.png" width="25">

A Markov decision process (MDP) is a discrete time stochastic control process. It provides a mathematical framework for modeling decision making in situations where outcomes are partly random and partly under the control of a decision maker. MDPs are useful for studying optimization problems solved via dynamic programming and reinforcement learning. MDPs were known at least as early as the 1950s;a core body of research on Markov decision processes resulted from Ronald Howard's 1960 book, Dynamic Programming and Markov Processes.They are used in many disciplines, including robotics, automatic control, economics and manufacturing. The name of MDPs comes from the Russian mathematician Andrey Markov.  [Wikipedia](https://en.wikipedia.org/wiki/Markov_decision_process).

## Problem : Canonical Example: Grid World

<img src="https://github.com/AissamDjahnine/markov-decision-process/blob/master/files./Example.jpg" >

- The agent lives in a grid.
- Walls block the agent’s path.
- The agent’s actions do not always go as planned :
    * 80% of the time, the action North takes the agent North  (if there is no wall there)
    * 10% of the time, North takes the agent West;10% East 
    * If there is a wall in the direction the agent would have been taken, the agent stays put 
- Big rewards come at the end

In an MDP, we want an optimal policy π*: S x 0:H → A
A policy π gives an action for each state for each time 
An optimal policy maximizes expected sum of rewards 

**Example how to calculate the utilities : 

<img src="https://github.com/AissamDjahnine/markov-decision-process/blob/master/files./ExampleUtilities.jpg" >

**Contrast** : In deterministic, want an optimal plan, or sequence of actions, from start to a goal

## ALgorithms : 
**value iteration (Bellman 1957) :** 
which is also called backward induction, the π function is not used; instead, the value of π ( s ) is calculated within V(s) whenever it is needed. Substituting the calculation of π ( s ) into the calculation of V(s) gives the combined step.

**Algorithm :**
<img src="https://github.com/AissamDjahnine/markov-decision-process/blob/master/files./valueiteralgorithm.png" >

**Policy iteration** :
In policy iteration (Howard 1960), step one is performed once, and then step two is repeated until it converges. Then step one is again performed once and so on.
Policy iteration is usually slower than value iteration for a large number of possible states. 

**Algorithm :**
<img src="https://github.com/AissamDjahnine/markov-decision-process/blob/master/files./politiqueiteralgorithm.png">

Note: in this code , we will note treat this algorithm ( we will poste it later ) 

## Getting Started & Prerequisites :

**Matlab Versions and Libraries :** 

* You need a MATLAB license and an install of MATLAB. .

* No Matlab toolboxes should be required for this program. 

**Functions Provided :** 
   * You find different functions to create the scenario and display the :**Utilities,Rewards and Politique** estimated withing the valute iteration algorithm ( No modify needed , however You're free to add some features ) : 
   
 - [ ValueIteration ]() : Value iteration algorithm.
 - [NeighboursSearch]() : Searhc the possible neighbours for each case.
 - [DisplayUtilities]() : Display utility values on the grid.
 - [ DisplayReward  ](https://github.com/AissamDjahnine/markov-decision-process/blob/master/DisplayReward.m) : Diplay award values on the grid.
 - [DisplayPolitique](https://github.com/AissamDjahnine/markov-decision-process/blob/master/DisplayPolitique.m) : Display the optimal politique.
 
 Also you find some of the variables as : **Escompte factor** , **precision** that you can search for more details .
 
## Execution & tests : 

   In the figures below , you find an examlpe of the applicaiton of the value iteration algorithm : **Utility , Rewards and optimal politique values**
  
Utilities    |   Optimal politique             
:------------:|:------------------------:
<img src="https://github.com/AissamDjahnine/markov-decision-process/blob/master/files./UtilitiesValues.jpg" > | <img src="https://github.com/AissamDjahnine/markov-decision-process/blob/master/files./OptimalPolitiquee.jpg">    

** When testing the code , you will see an iteractive display of the evolution of the utilities in time ( check code )

## Authors

**Djahnine Aissam**  

- [Github Profile](https://github.com/AissamDjahnine)
- [Linkedin Profile](https://www.linkedin.com/in/aissamdjahnine/)


## Acknowledgments

* Part of this job was supported by : Valentin Marcel  :thumbsup:
