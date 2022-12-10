get_puzzle(Intial):-
	Intial = [0,2,6,0,0,0,8,1,0
			 ,3,0,0,7,0,8,0,0,6
			 ,4,0,0,0,5,0,0,0,7
			 ,0,5,0,1,0,7,0,9,0
			 ,0,0,3,9,0,5,1,0,0
			 ,0,4,0,3,0,2,0,5,0
			 ,1,0,0,0,3,0,0,0,2
			 ,5,0,0,2,0,4,0,0,9
			 ,0,3,8,0,0,0,4,6,0],!.

set_at_idx(_,_,_,[],[]):-!.
set_at_idx(Idx,Idx,Value,[Cell_value|Rest],New_puzz):-
	Cell_value = 0,
	Inc is Idx + 1,
	set_at_idx(Inc,Idx,Value,Rest,New_puzz_rest),
	New_puzz = [Value|New_puzz_rest].
set_at_idx(Idx_count,Idx,Value,[Cell|Rest],New_puzz):-
	not(Idx_count is Idx),
	Inc is Idx_count + 1,
	set_at_idx(Inc,Idx,Value,Rest,New_puzz_rest),
	New_puzz = [Cell|New_puzz_rest].

set_at(Idx,Value,Puzz,New_puzz):-
	set_at_idx(0,Idx,Value,Puzz,New_puzz),!.

put_num(Idx,Puzz,New_puzz,1):-
	set_at(Idx,1,Puzz,New_puzz).
put_num(Idx,Puzz,New_puzz,2):-
	set_at(Idx,2,Puzz,New_puzz).
put_num(Idx,Puzz,New_puzz,3):-
	set_at(Idx,3,Puzz,New_puzz).
put_num(Idx,Puzz,New_puzz,4):-
	set_at(Idx,4,Puzz,New_puzz).
put_num(Idx,Puzz,New_puzz,5):-
	set_at(Idx,5,Puzz,New_puzz).
put_num(Idx,Puzz,New_puzz,6):-
	set_at(Idx,6,Puzz,New_puzz).
put_num(Idx,Puzz,New_puzz,7):-
	set_at(Idx,7,Puzz,New_puzz).
put_num(Idx,Puzz,New_puzz,8):-
	set_at(Idx,8,Puzz,New_puzz).
put_num(Idx,Puzz,New_puzz,9):-
	set_at(Idx,9,Puzz,New_puzz).

cell_contradiction(Value,Cell,R,C,B_num,Idx,Cell_idx):-
	Idx \= Cell_idx,
	Value is Cell,
	R1 is Cell_idx//9,
	C1 is mod(Cell_idx,9),
	B1 is 3*(R1//3) + C1//3,
	(R1 is R;C1 is C;B1 is B_num),!.

check_Puzz(_,_,_,_,_,_,[]):-!.
check_Puzz(Curr_idx,Value,Idx,R,C,B_num,[Cell|Rest]):-
	Inc is Curr_idx + 1,
	check_Puzz(Inc,Value,Idx,R,C,B_num,Rest),
	not(cell_contradiction(Value,Cell,R,C,B_num,Idx,Curr_idx)).

valid_move(Value,Idx,Puzz):-
	R is Idx//9,
	C is mod(Idx,9),
	B_num is 3*(R//3) + C//3,
	check_Puzz(0,Value,Idx,R,C,B_num,Puzz),!.

/*State :
 [List of Board Current Values
 ,Index of the Cell that would be filled in following state]
*/
get_state([Puzz,Idx],[Puzz,Inc],Cell_value):-
	Cell_value \= 0,
	Inc is Idx + 1.
get_state([Puzz,Idx],[New_puzz,Inc],Cell_value):-
	Cell_value = 0,
	put_num(Idx,Puzz,New_puzz,Value),
	valid_move(Value,Idx,New_puzz),
	Inc is Idx + 1.

move([Puzz,Idx],Next_state):-
	nth0(Idx,Puzz,Cell_value),
	get_state([Puzz,Idx],Next_state,Cell_value).


children([Puzz,Idx],Children):-
	findall(Next_state,move([Puzz,Idx],Next_state),Children).
%BFS
path([[Puzz,81]|_],Puzz).
path([Curr_state|Open_rest],Sol):-
	children(Curr_state,Children),
	append(Open_rest,Children,New_open),
	path(New_open,Sol).

solve(Sol):-
	get_puzzle(Intial),
	path([[Intial,0]],Sol).

