/* Shared
* Author: Banula Perera
* IIT: 20212085
*UOW: W1871527
* Creation date: 2024-12-06
*/
MACHINE
    Shared
    
SETS
    PLAYERS = { Player_1, Player_2 };
    MESSAGE = { Success, Failure_Ship_Already_Exists, Failure_Max_Ships_Deployed };
    GAME_STATES = { Ongoing, Player_1_Win, Player_2_Win, Both_players_need_to_deploy_their_fleet };
    SHOOTING_REPORT = { hit, miss, Shot_Already_Taken }
    
CONSTANTS
    grid,
    num_of_battleships
    
PROPERTIES
    grid = ( 1..10 ) * ( 1..10 ) &
    num_of_battleships : NAT1 &
    num_of_battleships = 3
    
END
