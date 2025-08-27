/* Battleship_Board_Game
*Author: Banula Perera
* IIT: 20212085
*UOW: W1871527
*/
MACHINE
    Battleship_Board_Game

SEES
    Shared

DEFINITIONS
    ANIMATION_FUNCTION == ( { row , col , img | row : 2 .. 11 & col : 1 .. 21 & img = 0 } ) ;
    ANIMATION_FUNCTION1 == ( { row , col , img | row : { 1 } & col : { 1 } & img = 2 } ) ;
    ANIMATION_FUNCTION2 == ( { row , col , img | row : { 1 } & col : { 2 } & img = 0 } ) ;
    ANIMATION_FUNCTION3 == ( { row , col , img | row : { 1 } & col : { 3 } & img = 3 } ) ;
    ANIMATION_FUNCTION4 == ( { row , col , img | row : 2 .. 11 & col : { 11 } & img = 1 } ) ;
    ANIMATION_FUNCTION5 == ( { row , col , img | ( row - 1 |-> col ) : player1_battleships_position & img = 4 } ) ;
    ANIMATION_FUNCTION6 == ( { row , col , img | ( row - 1 |-> col - 11 ) : player2_battleships_position & img = 4 } ) ;
    ANIMATION_FUNCTION7 == ( { row , col , img | ( row - 1 |-> col - 11 ) : ( player1_shooting_grid - player2_battleships_position ) & img = 5 } ) ;
    ANIMATION_FUNCTION8 == ( { row , col , img | ( row - 1 |-> col ) : ( player2_shooting_grid - player1_battleships_position ) & img = 5 } ) ;
    ANIMATION_FUNCTION9 == ( { row , col , img | ( row - 1 |-> col - 11 ) : ( player2_battleships_position /\ player1_shooting_grid ) & img = 6 } ) ;
    ANIMATION_FUNCTION10 == ( { row , col , img | ( row - 1 |-> col ) : ( player1_battleships_position /\ player2_shooting_grid ) & img = 6 } ) ;


    ANIMATION_IMG0 == "images/empty_cell.png" ;
    ANIMATION_IMG1 == "images/black_cell.png" ;
    ANIMATION_IMG2 == "images/player_1.png" ;
    ANIMATION_IMG3 == "images/player_2.png" ;
    ANIMATION_IMG4 == "images/anchor.png" ;
    ANIMATION_IMG5 == "images/shoot.png" ;
    ANIMATION_IMG6 == "images/hit.png" ;


ABSTRACT_VARIABLES
    player1_battleships_position , /* Set of Player 1's ship positions */
    player2_battleships_position , /* Set of Player 2's ship positions */
    turn ,                        /* Current player's turn */
    current_state ,               /* Current state of the game */
    player1_shooting_grid ,       /* Set of positions Player 1 has shot at */
    player2_shooting_grid         /* Set of positions Player 2 has shot at */

INVARIANT
   player1_battleships_position <: grid & /* Player 1's ships must be within the grid */
    player2_battleships_position <: grid & /* Player 2's ships must be within the grid */
    card ( player1_battleships_position ) <= num_of_battleships & /* Player 1 cannot exceed max ships */
    card ( player2_battleships_position ) <= num_of_battleships & /* Player 2 cannot exceed max ships */
    turn : PLAYERS & /* Turn must belong to a valid player */
    current_state : GAME_STATES & /* Current state must be valid */
    player1_shooting_grid <: grid & /* Player 1's shots must be within the grid */
    player2_shooting_grid <: grid   /* Player 2's shots must be within the grid */

INITIALISATION
    player1_battleships_position := {} ||
    player2_battleships_position := {} ||
    turn := Player_1 ||
    current_state := Both_players_need_to_deploy_their_fleet ||
    player1_shooting_grid := {} ||
    player2_shooting_grid := {}

OPERATIONS

    /* Operation to deploy a fleet for a player */
    report <-- deployFleet ( player , positions ) =
    PRE
        player : PLAYERS &
        positions : grid &
        current_state = Both_players_need_to_deploy_their_fleet
    THEN
        IF ( player = Player_1 )
        THEN
            IF ( card ( player1_battleships_position ) < num_of_battleships )
            THEN
                IF ( positions /: player1_battleships_position )
                THEN
                    IF
                        /*check whether the player_1 deployed  already 2 ship and player_2 deployed all of the ship*/
                        ( card ( player1_battleships_position ) = 2 ) & card ( player2_battleships_position ) = num_of_battleships
                    THEN
                        player1_battleships_position := player1_battleships_position \/ { positions } ||
                        current_state := Ongoing ||
                        report := Success
                    ELSE
                        player1_battleships_position := player1_battleships_position \/ { positions } ||
                        report := Success
                    END
                ELSE
                    report := Failure_Ship_Already_Exists
                END
            ELSE
                report := Failure_Max_Ships_Deployed
            END
        ELSE
            IF ( card ( player2_battleships_position ) < num_of_battleships )
            THEN
                IF ( positions /: player2_battleships_position )
                THEN
                    IF
                         /*check whether the player_2 deployed  already 2 ship and player_1 deployed all of the ship*/
                        ( card ( player2_battleships_position ) = 2 ) & card ( player1_battleships_position ) = num_of_battleships
                    THEN
                        player2_battleships_position := player2_battleships_position \/ { positions } ||
                        current_state := Ongoing ||
                        report := Success
                    ELSE
                        player2_battleships_position := player2_battleships_position \/ { positions } ||
                        report := Success
                    END
                ELSE
                    report := Failure_Ship_Already_Exists
                END
            ELSE
                report := Failure_Max_Ships_Deployed
            END
        END
    END ;


    /* Operation to shoot to a fleet by players */
    report <-- playerShoots ( target ) =
    PRE
        target : grid &
        card ( player1_battleships_position ) /= 0 &
        card ( player2_battleships_position ) /= 0 &
        current_state = Ongoing
    THEN
        IF ( turn = Player_1 )
        THEN
            IF ( target /: player1_shooting_grid )
            THEN
                IF ( target : player2_battleships_position )
                THEN
                    /*Check whether the remainig number of fleet of player_2 is 1*/
                    IF ( card ( player2_battleships_position ) = 1 )
                    THEN
                        player2_battleships_position := player2_battleships_position - { target } ||
                        report := hit ||
                        player1_shooting_grid := player1_shooting_grid \/ { target } ||
                        current_state := Player_1_Win
                    ELSE
                        player2_battleships_position := player2_battleships_position - { target } ||
                        report := hit ||
                        player1_shooting_grid := player1_shooting_grid \/ { target } ||
                        turn := Player_2
                    END
                ELSE
                    report := miss ||
                    player1_shooting_grid := player1_shooting_grid \/ { target } ||
                    turn := Player_2
                END
            ELSE
                report := Shot_Already_Taken
            END
        ELSE
            IF ( target /: player2_shooting_grid )
            THEN
                IF ( target : player1_battleships_position )
                THEN
                    /*Check whether the remainig number of fleet of player_1 is 1*/
                    IF ( card ( player1_battleships_position ) = 1 )
                    THEN
                        player1_battleships_position := player1_battleships_position - { target } ||
                        report := hit ||
                        player2_shooting_grid := player2_shooting_grid \/ { target } ||
                        current_state := Player_2_Win
                    ELSE
                        player1_battleships_position := player1_battleships_position - { target } ||
                        report := hit ||
                        player2_shooting_grid := player2_shooting_grid \/ { target } ||
                        turn := Player_1
                    END
                ELSE
                    report := miss ||
                    player2_shooting_grid := player2_shooting_grid \/ { target } ||
                    turn := Player_1
                END
            ELSE
                report := Shot_Already_Taken
            END
        END
    END ;

    /* Operation to outputs the location of all the ships left in the player's fleet */
    shipsquares <-- shipLocations ( player ) =
    PRE
        player : PLAYERS &
        card ( player1_battleships_position ) + card ( player2_battleships_position ) /= 0
    THEN
        IF ( player = Player_1 )
        THEN
            shipsquares := player1_battleships_position
        ELSE
            shipsquares := player2_battleships_position
        END
    END ;

    /* Operation to outputs the numbers of ships left in both players’ fleets */
    shipCounts <-- shipsLeft =
    PRE
        card ( player1_battleships_position ) + card ( player2_battleships_position ) /= 0
    THEN
        shipCounts := card ( player1_battleships_position ) + card ( player2_battleships_position )
    END ;

    /* Operation to outputs the number of shots taken by the player */
    shotCount <-- shotsTaken ( player ) =
    PRE
        player : PLAYERS &
        card ( player1_battleships_position ) + card ( player2_battleships_position ) /= 0 &
        current_state /= Both_players_need_to_deploy_their_fleet
    THEN
        IF ( player = Player_1 )
        THEN
            shotCount := card ( player1_shooting_grid )
        ELSE
            shotCount := card ( player2_shooting_grid )
        END
    END ;

    /* Operation to output the current games' state */
    report <-- gameStatus =
    BEGIN
        report := current_state
    END


END
