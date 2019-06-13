##  markov-decision-process<img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./Matlab_Logo.png" width="25">

A Markov decision process (MDP) is a discrete time stochastic control process. It provides a mathematical framework for modeling decision making in situations where outcomes are partly random and partly under the control of a decision maker. MDPs are useful for studying optimization problems solved via dynamic programming and reinforcement learning. MDPs were known at least as early as the 1950s;a core body of research on Markov decision processes resulted from Ronald Howard's 1960 book, Dynamic Programming and Markov Processes.They are used in many disciplines, including robotics, automatic control, economics and manufacturing. The name of MDPs comes from the Russian mathematician Andrey Markov.  [Wikipedia](https://en.wikipedia.org/wiki/Markov_decision_process).

## ALgorithms : 
**value iteration (Bellman 1957) :** 
which is also called backward induction, the π function is not used; instead, the value of π ( s ) is calculated within V(s) whenever it is needed. Substituting the calculation of π ( s ) into the calculation of V(s) gives the combined step.

**Algorithm :**
<img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./valueiteralgorithm.png" width="25">

**Policy iteration** :
In policy iteration (Howard 1960), step one is performed once, and then step two is repeated until it converges. Then step one is again performed once and so on.
Policy iteration is usually slower than value iteration for a large number of possible states. 

**Algorithm :**
<img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./politiqueiteralgorithm.png" width="25">
## References : 
  - Patel, A. Introduction to A*. Retrieved April 29, 2016
  - [TutorialsPoint](https://www.tutorialspoint.com/artificial_intelligence/artificial_intelligence_popular_search_algorithms.htm)
     
   
## Getting Started & Prerequisites :

**Matlab Versions and Libraries :** 

* You need a MATLAB license and an install of MATLAB. .

* No Matlab toolboxes should be required for this program. 

**Functions Provided :** 
   * You find different functions to create the scenario and display the path estimated withing the search functions ( No modify needed however You're free to add some features ) : 
       - [CreateScenario](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/CreateScenario.m),[DisplayScenario](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/DisplayScenario.m) : Create the scenario as a map.We first select the **TARGET** node, then the **Obstacles** ( follow instructions ) and finely the **START** node .See figure
       
       
Target Node        |    Obstacles         |      Start Node        
:-----------------:|:--------------------:|:-------------------:
<img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./target.jpg" width="250"> |  <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./obstacle.jpg" width="250"> | <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./start.jpg" width="250">

 - [AnimatePath](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/filesAnimatePath.m) : Display the founded path on the scenario
 - [Matrix2List](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/Matrix2List.m) : Converts an incident matrix to an incident list
 - [IncidentMatrix](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/IncidentMatrix.m) : This function creates the incident matrix based on the scneario defined on the graphical interface form script main.m
 - [IncidentList](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/IncidentList.m) : This function creates the incident List based on the scneario defined on the graphical interface form script main.m
 - [IncidentMatrix2](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/IncidentMatrix2.m) , [IncidentList2](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/IncidentList2.m) :same functions as above but uses irregular costs , check [update_nodes](https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/Updates_Nodes.m).
      
           
## Execution & tests : 
   In the figure below , you find an examlpe of the different algorithms : BFS,DFS,A*( euclidian distance , manhattan distance and Variable Costs ) .

Test the code with your own positions of the : target,Start and obsctacles nodes .


BFS       | DFS    |  A* (Euclidian distance) | A* (Manhattan distance) | A*(Variable Cost)            
:--------:|:------:|:------------------------:|:-----------------------:|:----------------:
<img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./BFS.jpg" width="250"> |  <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./DFS.jpg" width="250"> | <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./Astareuc.jpg" width="250"> | <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/files./Astarmann.jpg" width="250"> | <img src="https://github.com/AissamDjahnine/Search-Algorithms-in-AI/blob/master/Astarvariab.jpg" width="250">  

**Codes and simulations in Python will be provided soon**


## Authors

**Djahnine Aissam**  
- [Github Profile](https://github.com/AissamDjahnine)
- [Linkedin Profile](https://www.linkedin.com/in/aissamdjahnine/)


## Acknowledgments

* Part of this job was supported by : Valentin Marcel  :thumbsup:
