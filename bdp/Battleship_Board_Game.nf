Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Battleship_Board_Game))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Battleship_Board_Game))==(Machine(Battleship_Board_Game));
  Level(Machine(Battleship_Board_Game))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Battleship_Board_Game)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Battleship_Board_Game))==(Shared)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Battleship_Board_Game))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Battleship_Board_Game))==(?);
  List_Includes(Machine(Battleship_Board_Game))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Battleship_Board_Game))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Battleship_Board_Game))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Battleship_Board_Game))==(?);
  Context_List_Variables(Machine(Battleship_Board_Game))==(?);
  Abstract_List_Variables(Machine(Battleship_Board_Game))==(?);
  Local_List_Variables(Machine(Battleship_Board_Game))==(player2_shooting_grid,player1_shooting_grid,current_state,turn,player2_battleships_position,player1_battleships_position);
  List_Variables(Machine(Battleship_Board_Game))==(player2_shooting_grid,player1_shooting_grid,current_state,turn,player2_battleships_position,player1_battleships_position);
  External_List_Variables(Machine(Battleship_Board_Game))==(player2_shooting_grid,player1_shooting_grid,current_state,turn,player2_battleships_position,player1_battleships_position)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Battleship_Board_Game))==(?);
  Abstract_List_VisibleVariables(Machine(Battleship_Board_Game))==(?);
  External_List_VisibleVariables(Machine(Battleship_Board_Game))==(?);
  Expanded_List_VisibleVariables(Machine(Battleship_Board_Game))==(?);
  List_VisibleVariables(Machine(Battleship_Board_Game))==(?);
  Internal_List_VisibleVariables(Machine(Battleship_Board_Game))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Battleship_Board_Game))==(btrue);
  Gluing_List_Invariant(Machine(Battleship_Board_Game))==(btrue);
  Expanded_List_Invariant(Machine(Battleship_Board_Game))==(btrue);
  Abstract_List_Invariant(Machine(Battleship_Board_Game))==(btrue);
  Context_List_Invariant(Machine(Battleship_Board_Game))==(btrue);
  List_Invariant(Machine(Battleship_Board_Game))==(player1_battleships_position <: grid & player2_battleships_position <: grid & card(player1_battleships_position)<=num_of_battleships & card(player2_battleships_position)<=num_of_battleships & turn: PLAYERS & current_state: GAME_STATES & player1_shooting_grid <: grid & player2_shooting_grid <: grid)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Battleship_Board_Game))==(btrue);
  Abstract_List_Assertions(Machine(Battleship_Board_Game))==(btrue);
  Context_List_Assertions(Machine(Battleship_Board_Game))==(btrue);
  List_Assertions(Machine(Battleship_Board_Game))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Battleship_Board_Game))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Battleship_Board_Game))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Battleship_Board_Game))==(player1_battleships_position,player2_battleships_position,turn,current_state,player1_shooting_grid,player2_shooting_grid:={},{},Player_1,Both_players_need_to_deploy_their_fleet,{},{});
  Context_List_Initialisation(Machine(Battleship_Board_Game))==(skip);
  List_Initialisation(Machine(Battleship_Board_Game))==(player1_battleships_position:={} || player2_battleships_position:={} || turn:=Player_1 || current_state:=Both_players_need_to_deploy_their_fleet || player1_shooting_grid:={} || player2_shooting_grid:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Battleship_Board_Game))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Battleship_Board_Game),Machine(Shared))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Battleship_Board_Game))==(btrue);
  List_Constraints(Machine(Battleship_Board_Game))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Battleship_Board_Game))==(deployFleet,playerShoots,shipLocations,shipsLeft,shotsTaken,gameStatus);
  List_Operations(Machine(Battleship_Board_Game))==(deployFleet,playerShoots,shipLocations,shipsLeft,shotsTaken,gameStatus)
END
&
THEORY ListInputX IS
  List_Input(Machine(Battleship_Board_Game),deployFleet)==(player,positions);
  List_Input(Machine(Battleship_Board_Game),playerShoots)==(target);
  List_Input(Machine(Battleship_Board_Game),shipLocations)==(player);
  List_Input(Machine(Battleship_Board_Game),shipsLeft)==(?);
  List_Input(Machine(Battleship_Board_Game),shotsTaken)==(player);
  List_Input(Machine(Battleship_Board_Game),gameStatus)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Battleship_Board_Game),deployFleet)==(report);
  List_Output(Machine(Battleship_Board_Game),playerShoots)==(report);
  List_Output(Machine(Battleship_Board_Game),shipLocations)==(shipsquares);
  List_Output(Machine(Battleship_Board_Game),shipsLeft)==(shipCounts);
  List_Output(Machine(Battleship_Board_Game),shotsTaken)==(shotCount);
  List_Output(Machine(Battleship_Board_Game),gameStatus)==(report)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Battleship_Board_Game),deployFleet)==(report <-- deployFleet(player,positions));
  List_Header(Machine(Battleship_Board_Game),playerShoots)==(report <-- playerShoots(target));
  List_Header(Machine(Battleship_Board_Game),shipLocations)==(shipsquares <-- shipLocations(player));
  List_Header(Machine(Battleship_Board_Game),shipsLeft)==(shipCounts <-- shipsLeft);
  List_Header(Machine(Battleship_Board_Game),shotsTaken)==(shotCount <-- shotsTaken(player));
  List_Header(Machine(Battleship_Board_Game),gameStatus)==(report <-- gameStatus)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Battleship_Board_Game),deployFleet)==(player: PLAYERS & positions: grid & current_state = Both_players_need_to_deploy_their_fleet);
  List_Precondition(Machine(Battleship_Board_Game),playerShoots)==(target: grid & card(player1_battleships_position)/=0 & card(player2_battleships_position)/=0 & current_state = Ongoing);
  List_Precondition(Machine(Battleship_Board_Game),shipLocations)==(player: PLAYERS & card(player1_battleships_position)+card(player2_battleships_position)/=0);
  List_Precondition(Machine(Battleship_Board_Game),shipsLeft)==(card(player1_battleships_position)+card(player2_battleships_position)/=0);
  List_Precondition(Machine(Battleship_Board_Game),shotsTaken)==(player: PLAYERS & card(player1_battleships_position)+card(player2_battleships_position)/=0 & current_state/=Both_players_need_to_deploy_their_fleet);
  List_Precondition(Machine(Battleship_Board_Game),gameStatus)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Battleship_Board_Game),gameStatus)==(btrue | report:=current_state);
  Expanded_List_Substitution(Machine(Battleship_Board_Game),shotsTaken)==(player: PLAYERS & card(player1_battleships_position)+card(player2_battleships_position)/=0 & current_state/=Both_players_need_to_deploy_their_fleet | player = Player_1 ==> shotCount:=card(player1_shooting_grid) [] not(player = Player_1) ==> shotCount:=card(player2_shooting_grid));
  Expanded_List_Substitution(Machine(Battleship_Board_Game),shipsLeft)==(card(player1_battleships_position)+card(player2_battleships_position)/=0 | shipCounts:=card(player1_battleships_position)+card(player2_battleships_position));
  Expanded_List_Substitution(Machine(Battleship_Board_Game),shipLocations)==(player: PLAYERS & card(player1_battleships_position)+card(player2_battleships_position)/=0 | player = Player_1 ==> shipsquares:=player1_battleships_position [] not(player = Player_1) ==> shipsquares:=player2_battleships_position);
  Expanded_List_Substitution(Machine(Battleship_Board_Game),playerShoots)==(target: grid & card(player1_battleships_position)/=0 & card(player2_battleships_position)/=0 & current_state = Ongoing | turn = Player_1 ==> (target/:player1_shooting_grid ==> (target: player2_battleships_position ==> (card(player2_battleships_position) = 1 ==> player2_battleships_position,report,player1_shooting_grid,current_state:=player2_battleships_position-{target},hit,player1_shooting_grid\/{target},Player_1_Win [] not(card(player2_battleships_position) = 1) ==> player2_battleships_position,report,player1_shooting_grid,turn:=player2_battleships_position-{target},hit,player1_shooting_grid\/{target},Player_2) [] not(target: player2_battleships_position) ==> report,player1_shooting_grid,turn:=miss,player1_shooting_grid\/{target},Player_2) [] not(target/:player1_shooting_grid) ==> report:=Shot_Already_Taken) [] not(turn = Player_1) ==> (target/:player2_shooting_grid ==> (target: player1_battleships_position ==> (card(player1_battleships_position) = 1 ==> player1_battleships_position,report,player2_shooting_grid,current_state:=player1_battleships_position-{target},hit,player2_shooting_grid\/{target},Player_2_Win [] not(card(player1_battleships_position) = 1) ==> player1_battleships_position,report,player2_shooting_grid,turn:=player1_battleships_position-{target},hit,player2_shooting_grid\/{target},Player_1) [] not(target: player1_battleships_position) ==> report,player2_shooting_grid,turn:=miss,player2_shooting_grid\/{target},Player_1) [] not(target/:player2_shooting_grid) ==> report:=Shot_Already_Taken));
  Expanded_List_Substitution(Machine(Battleship_Board_Game),deployFleet)==(player: PLAYERS & positions: grid & current_state = Both_players_need_to_deploy_their_fleet | player = Player_1 ==> (card(player1_battleships_position)<num_of_battleships ==> (positions/:player1_battleships_position ==> (card(player1_battleships_position) = 2 & card(player2_battleships_position) = num_of_battleships ==> player1_battleships_position,current_state,report:=player1_battleships_position\/{positions},Ongoing,Success [] not(card(player1_battleships_position) = 2 & card(player2_battleships_position) = num_of_battleships) ==> player1_battleships_position,report:=player1_battleships_position\/{positions},Success) [] not(positions/:player1_battleships_position) ==> report:=Failure_Ship_Already_Exists) [] not(card(player1_battleships_position)<num_of_battleships) ==> report:=Failure_Max_Ships_Deployed) [] not(player = Player_1) ==> (card(player2_battleships_position)<num_of_battleships ==> (positions/:player2_battleships_position ==> (card(player2_battleships_position) = 2 & card(player1_battleships_position) = num_of_battleships ==> player2_battleships_position,current_state,report:=player2_battleships_position\/{positions},Ongoing,Success [] not(card(player2_battleships_position) = 2 & card(player1_battleships_position) = num_of_battleships) ==> player2_battleships_position,report:=player2_battleships_position\/{positions},Success) [] not(positions/:player2_battleships_position) ==> report:=Failure_Ship_Already_Exists) [] not(card(player2_battleships_position)<num_of_battleships) ==> report:=Failure_Max_Ships_Deployed));
  List_Substitution(Machine(Battleship_Board_Game),deployFleet)==(IF player = Player_1 THEN IF card(player1_battleships_position)<num_of_battleships THEN IF positions/:player1_battleships_position THEN IF card(player1_battleships_position) = 2 & card(player2_battleships_position) = num_of_battleships THEN player1_battleships_position:=player1_battleships_position\/{positions} || current_state:=Ongoing || report:=Success ELSE player1_battleships_position:=player1_battleships_position\/{positions} || report:=Success END ELSE report:=Failure_Ship_Already_Exists END ELSE report:=Failure_Max_Ships_Deployed END ELSE IF card(player2_battleships_position)<num_of_battleships THEN IF positions/:player2_battleships_position THEN IF card(player2_battleships_position) = 2 & card(player1_battleships_position) = num_of_battleships THEN player2_battleships_position:=player2_battleships_position\/{positions} || current_state:=Ongoing || report:=Success ELSE player2_battleships_position:=player2_battleships_position\/{positions} || report:=Success END ELSE report:=Failure_Ship_Already_Exists END ELSE report:=Failure_Max_Ships_Deployed END END);
  List_Substitution(Machine(Battleship_Board_Game),playerShoots)==(IF turn = Player_1 THEN IF target/:player1_shooting_grid THEN IF target: player2_battleships_position THEN IF card(player2_battleships_position) = 1 THEN player2_battleships_position:=player2_battleships_position-{target} || report:=hit || player1_shooting_grid:=player1_shooting_grid\/{target} || current_state:=Player_1_Win ELSE player2_battleships_position:=player2_battleships_position-{target} || report:=hit || player1_shooting_grid:=player1_shooting_grid\/{target} || turn:=Player_2 END ELSE report:=miss || player1_shooting_grid:=player1_shooting_grid\/{target} || turn:=Player_2 END ELSE report:=Shot_Already_Taken END ELSE IF target/:player2_shooting_grid THEN IF target: player1_battleships_position THEN IF card(player1_battleships_position) = 1 THEN player1_battleships_position:=player1_battleships_position-{target} || report:=hit || player2_shooting_grid:=player2_shooting_grid\/{target} || current_state:=Player_2_Win ELSE player1_battleships_position:=player1_battleships_position-{target} || report:=hit || player2_shooting_grid:=player2_shooting_grid\/{target} || turn:=Player_1 END ELSE report:=miss || player2_shooting_grid:=player2_shooting_grid\/{target} || turn:=Player_1 END ELSE report:=Shot_Already_Taken END END);
  List_Substitution(Machine(Battleship_Board_Game),shipLocations)==(IF player = Player_1 THEN shipsquares:=player1_battleships_position ELSE shipsquares:=player2_battleships_position END);
  List_Substitution(Machine(Battleship_Board_Game),shipsLeft)==(shipCounts:=card(player1_battleships_position)+card(player2_battleships_position));
  List_Substitution(Machine(Battleship_Board_Game),shotsTaken)==(IF player = Player_1 THEN shotCount:=card(player1_shooting_grid) ELSE shotCount:=card(player2_shooting_grid) END);
  List_Substitution(Machine(Battleship_Board_Game),gameStatus)==(report:=current_state)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Battleship_Board_Game))==(?);
  Inherited_List_Constants(Machine(Battleship_Board_Game))==(?);
  List_Constants(Machine(Battleship_Board_Game))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Battleship_Board_Game),SHOOTING_REPORT)==({hit,miss,over,Shot_Already_Taken});
  Context_List_Enumerated(Machine(Battleship_Board_Game))==(PLAYERS,MESSAGE,GAME_STATES,SHOOTING_REPORT);
  Context_List_Defered(Machine(Battleship_Board_Game))==(?);
  Context_List_Sets(Machine(Battleship_Board_Game))==(PLAYERS,MESSAGE,GAME_STATES,SHOOTING_REPORT);
  List_Valuable_Sets(Machine(Battleship_Board_Game))==(?);
  Inherited_List_Enumerated(Machine(Battleship_Board_Game))==(?);
  Inherited_List_Defered(Machine(Battleship_Board_Game))==(?);
  Inherited_List_Sets(Machine(Battleship_Board_Game))==(?);
  List_Enumerated(Machine(Battleship_Board_Game))==(?);
  List_Defered(Machine(Battleship_Board_Game))==(?);
  List_Sets(Machine(Battleship_Board_Game))==(?);
  Set_Definition(Machine(Battleship_Board_Game),GAME_STATES)==({Ongoing,Player_1_Win,Player_2_Win,Both_players_need_to_deploy_their_fleet});
  Set_Definition(Machine(Battleship_Board_Game),MESSAGE)==({Success,Failure_Ship_Already_Exists,Failure_Max_Ships_Deployed});
  Set_Definition(Machine(Battleship_Board_Game),PLAYERS)==({Player_1,Player_2})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Battleship_Board_Game))==(?);
  Expanded_List_HiddenConstants(Machine(Battleship_Board_Game))==(?);
  List_HiddenConstants(Machine(Battleship_Board_Game))==(?);
  External_List_HiddenConstants(Machine(Battleship_Board_Game))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Battleship_Board_Game))==(btrue);
  Context_List_Properties(Machine(Battleship_Board_Game))==(grid = (1..10)*(1..10) & num_of_battleships: NAT1 & num_of_battleships = 3 & PLAYERS: FIN(INTEGER) & not(PLAYERS = {}) & MESSAGE: FIN(INTEGER) & not(MESSAGE = {}) & GAME_STATES: FIN(INTEGER) & not(GAME_STATES = {}) & SHOOTING_REPORT: FIN(INTEGER) & not(SHOOTING_REPORT = {}));
  Inherited_List_Properties(Machine(Battleship_Board_Game))==(btrue);
  List_Properties(Machine(Battleship_Board_Game))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Battleship_Board_Game),Machine(Shared))==(?);
  Seen_Context_List_Enumerated(Machine(Battleship_Board_Game))==(?);
  Seen_Context_List_Invariant(Machine(Battleship_Board_Game))==(btrue);
  Seen_Context_List_Assertions(Machine(Battleship_Board_Game))==(btrue);
  Seen_Context_List_Properties(Machine(Battleship_Board_Game))==(btrue);
  Seen_List_Constraints(Machine(Battleship_Board_Game))==(btrue);
  Seen_List_Operations(Machine(Battleship_Board_Game),Machine(Shared))==(?);
  Seen_Expanded_List_Invariant(Machine(Battleship_Board_Game),Machine(Shared))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Battleship_Board_Game),deployFleet)==(?);
  List_ANY_Var(Machine(Battleship_Board_Game),playerShoots)==(?);
  List_ANY_Var(Machine(Battleship_Board_Game),shipLocations)==(?);
  List_ANY_Var(Machine(Battleship_Board_Game),shipsLeft)==(?);
  List_ANY_Var(Machine(Battleship_Board_Game),shotsTaken)==(?);
  List_ANY_Var(Machine(Battleship_Board_Game),gameStatus)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Battleship_Board_Game)) == (? | ? | player2_shooting_grid,player1_shooting_grid,current_state,turn,player2_battleships_position,player1_battleships_position | ? | deployFleet,playerShoots,shipLocations,shipsLeft,shotsTaken,gameStatus | ? | seen(Machine(Shared)) | ? | Battleship_Board_Game);
  List_Of_HiddenCst_Ids(Machine(Battleship_Board_Game)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Battleship_Board_Game)) == (?);
  List_Of_VisibleVar_Ids(Machine(Battleship_Board_Game)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Battleship_Board_Game)) == (?: ?);
  List_Of_Ids(Machine(Shared)) == (grid,num_of_battleships,PLAYERS,MESSAGE,GAME_STATES,SHOOTING_REPORT,Player_1,Player_2,Success,Failure_Ship_Already_Exists,Failure_Max_Ships_Deployed,Ongoing,Player_1_Win,Player_2_Win,Both_players_need_to_deploy_their_fleet,hit,miss,over,Shot_Already_Taken | ? | ? | ? | ? | ? | ? | ? | Shared);
  List_Of_HiddenCst_Ids(Machine(Shared)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Shared)) == (grid,num_of_battleships);
  List_Of_VisibleVar_Ids(Machine(Shared)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Shared)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Battleship_Board_Game)) == (Type(player2_shooting_grid) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(player1_shooting_grid) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(current_state) == Mvl(etype(GAME_STATES,?,?));Type(turn) == Mvl(etype(PLAYERS,?,?));Type(player2_battleships_position) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(player1_battleships_position) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Battleship_Board_Game)) == (Type(gameStatus) == Cst(etype(GAME_STATES,?,?),No_type);Type(shotsTaken) == Cst(btype(INTEGER,?,?),etype(PLAYERS,?,?));Type(shipsLeft) == Cst(btype(INTEGER,?,?),No_type);Type(shipLocations) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),etype(PLAYERS,?,?));Type(playerShoots) == Cst(etype(SHOOTING_REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(deployFleet) == Cst(etype(MESSAGE,?,?),etype(PLAYERS,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));
  Observers(Machine(Battleship_Board_Game)) == (Type(gameStatus) == Cst(etype(GAME_STATES,?,?),No_type);Type(shotsTaken) == Cst(btype(INTEGER,?,?),etype(PLAYERS,?,?));Type(shipsLeft) == Cst(btype(INTEGER,?,?),No_type);Type(shipLocations) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),etype(PLAYERS,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
