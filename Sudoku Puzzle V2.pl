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
			 
get_goal(Goal):-
	Goal = [7,2,6,4,9,3,8,1,5
		   ,3,1,5,7,2,8,9,4,6
		   ,4,8,9,6,5,1,2,3,7
		   ,8,5,2,1,4,7,6,9,3
		   ,6,7,3,9,8,5,1,2,4
		   ,9,4,1,3,6,2,7,5,8
		   ,1,9,4,8,3,6,5,7,2
		   ,5,6,7,2,1,4,3,8,9
		   ,2,3,8,5,7,9,4,6,1],!.
			 
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

put_a_num_at_cell(Idx,Puzz,New_puzz,1):-
	set_at(Idx,1,Puzz,New_puzz).
put_a_num_at_cell(Idx,Puzz,New_puzz,2):-
	set_at(Idx,2,Puzz,New_puzz).
put_a_num_at_cell(Idx,Puzz,New_puzz,3):-
	set_at(Idx,3,Puzz,New_puzz).
put_a_num_at_cell(Idx,Puzz,New_puzz,4):-
	set_at(Idx,4,Puzz,New_puzz).
put_a_num_at_cell(Idx,Puzz,New_puzz,5):-
	set_at(Idx,5,Puzz,New_puzz).
put_a_num_at_cell(Idx,Puzz,New_puzz,6):-
	set_at(Idx,6,Puzz,New_puzz).
put_a_num_at_cell(Idx,Puzz,New_puzz,7):-
	set_at(Idx,7,Puzz,New_puzz).
put_a_num_at_cell(Idx,Puzz,New_puzz,8):-
	set_at(Idx,8,Puzz,New_puzz).
put_a_num_at_cell(Idx,Puzz,New_puzz,9):-
	set_at(Idx,9,Puzz,New_puzz).
	
put_a_num_at_row(Row,Puzz,New_puzz,Value,Idx):-
	Idx is Row * 9,
	put_a_num_at_cell(Idx,Puzz,New_puzz,Value).
put_a_num_at_row(Row,Puzz,New_puzz,Value,Idx):-
	Idx is Row * 9 + 1,
	put_a_num_at_cell(Idx,Puzz,New_puzz,Value).
put_a_num_at_row(Row,Puzz,New_puzz,Value,Idx):-
	Idx is Row * 9 + 2,
	put_a_num_at_cell(Idx,Puzz,New_puzz,Value).
put_a_num_at_row(Row,Puzz,New_puzz,Value,Idx):-
	Idx is Row * 9 + 3,
	put_a_num_at_cell(Idx,Puzz,New_puzz,Value).
put_a_num_at_row(Row,Puzz,New_puzz,Value,Idx):-
	Idx is Row * 9 + 4,
	put_a_num_at_cell(Idx,Puzz,New_puzz,Value).
put_a_num_at_row(Row,Puzz,New_puzz,Value,Idx):-
	Idx is Row * 9 + 5,
	put_a_num_at_cell(Idx,Puzz,New_puzz,Value).
put_a_num_at_row(Row,Puzz,New_puzz,Value,Idx):-
	Idx is Row * 9 + 6,
	put_a_num_at_cell(Idx,Puzz,New_puzz,Value).
put_a_num_at_row(Row,Puzz,New_puzz,Value,Idx):-
	Idx is Row * 9 + 7,
	put_a_num_at_cell(Idx,Puzz,New_puzz,Value).
put_a_num_at_row(Row,Puzz,New_puzz,Value,Idx):-
	Idx is Row * 9 + 8,
	put_a_num_at_cell(Idx,Puzz,New_puzz,Value).
	
put_a_num_at_Board(Puzz,New_puzz,Value,Idx):-
	put_a_num_at_row(0,Puzz,New_puzz,Value,Idx).
put_a_num_at_Board(Puzz,New_puzz,Value,Idx):-
	put_a_num_at_row(1,Puzz,New_puzz,Value,Idx).
put_a_num_at_Board(Puzz,New_puzz,Value,Idx):-
	put_a_num_at_row(2,Puzz,New_puzz,Value,Idx).
put_a_num_at_Board(Puzz,New_puzz,Value,Idx):-
	put_a_num_at_row(3,Puzz,New_puzz,Value,Idx).
put_a_num_at_Board(Puzz,New_puzz,Value,Idx):-
	put_a_num_at_row(4,Puzz,New_puzz,Value,Idx).
put_a_num_at_Board(Puzz,New_puzz,Value,Idx):-
	put_a_num_at_row(5,Puzz,New_puzz,Value,Idx).
put_a_num_at_Board(Puzz,New_puzz,Value,Idx):-
	put_a_num_at_row(6,Puzz,New_puzz,Value,Idx).
put_a_num_at_Board(Puzz,New_puzz,Value,Idx):-
	put_a_num_at_row(7,Puzz,New_puzz,Value,Idx).
put_a_num_at_Board(Puzz,New_puzz,Value,Idx):-
	put_a_num_at_row(8,Puzz,New_puzz,Value,Idx).
		
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

get_state(st( Puzz , _ ),Open,Closed,st( New_puzz , Puzz )):-
	put_a_num_at_Board(Puzz,New_puzz,Value,Idx),
	\+member(st( New_puzz , _  ),Open),
	\+member(st( New_puzz , _  ),Closed),	
	valid_move(Value,Idx,New_puzz).
	
children(State,Open,Closed,Children):-
	findall(Next_state,get_state(State,Open,Closed,Next_state),Children).

get_state_from_open([State|Open_rest],State,Open_rest).

print_state_transition(State_num,st( Puzz , void ),_):-
	State_num = 0,
	write('S'),write(State_num),write(' = '),write(Puzz),nl,!.
print_state_transition(My_state_num,st( Puzz , Parent ),Closed):-
	member(st( Parent , Grand_parent ),Closed),
	print_state_transition(State_num,st( Parent , Grand_parent ),Closed),
	My_state_num is State_num + 1,
	write('S'),write(My_state_num),write(' = '),write(Puzz),nl.
%DFS	
path([st( Goal , Parent )|_],Closed,Goal):- 
	print_state_transition(_,st( Goal , Parent ),Closed).	
path([Curr_state|Open_rest],Closed,Sol):-
	get_state_from_open(Open,Curr_state,Open_rest),
	children(Curr_state,Open,Closed,Children),
	append(Children,Open_rest,New_open),
	path(New_open,[Curr_state|Closed],Sol).
	
solve():-
	get_puzzle(Intial),
	get_goal(Goal),
	path([st(Intial,void)],[],Goal).
	









