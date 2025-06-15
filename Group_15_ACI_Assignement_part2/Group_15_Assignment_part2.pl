% -------------------------------------------------------
% Prolog problem solved by 
% -------------------------------------------------------
% Sl.no BITS ID	       Name	             Contribution
% 1.    2024AA05041	  Amit Kumar	        100%
% 2     2024AA05042	  Yogesh Kumar	        100%
% 3.    2024AA05043	  Ashish Vashistha	    100%
% 4.    2024AA05044	  A Chakradhar Reddy	100%
% 5.    2024AA05045	  Karthik V	            100%
% -------------------------------------------------------
% Prolog Decision Tree-Based Classifier
% -------------------------------------------------------
% This Prolog program implements a simple decision tree
% classifier. It asks the user for attribute values 
% (true/false) and determines a predicted class (`c0` or `c1`).
% -------------------------------------------------------

% ---------------------------
% Main Predicate: predict_class/1
% ---------------------------
% This is the entry point for classification. 
% It starts the decision process by asking about the first attribute (a5).
predict_class(Class) :-
    ask(a5, A5),
    decide(A5, Class).

% ---------------------------
% Decision Rules
% ---------------------------
% If a5 is false, classify as c0 directly.
decide(false, c0) :- !.

% If a5 is true, ask for a8 and continue decision process.
decide(true, Class) :-
    ask(a8, A8),
    decide_a8(A8, Class).

% ---------------------------
% Decision Sub-Rules for a8
% ---------------------------
% If a8 is false, ask for a9 and continue decision process.
decide_a8(false, Class) :-
    ask(a9, A9),
    decide_a9(A9, Class).

% If a8 is true, ask for a1 and continue decision process.
decide_a8(true, Class) :-
    ask(a1, A1),
    decide_a1(A1, Class).

% ---------------------------
% Decision Sub-Rules for a9
% ---------------------------
% If a9 is false, ask for a2 and continue decision process.
decide_a9(false, Class) :-
    ask(a2, A2),
    decide_a2_9(A2, Class).

% If a9 is true, classify as c1 directly.
decide_a9(true, c1) :- !.

% ---------------------------
% Decision Sub-Rules for a1
% ---------------------------
% If a1 is false, ask for a2 and continue decision process.
decide_a1(false, Class) :-
    ask(a2, A2),
    decide_a2_1(A2, Class).

% If a1 is true, classify as c0 directly.
decide_a1(true, c0) :- !.

% ---------------------------
% Decision Sub-Rules for a2 when coming from a9
% ---------------------------
% If a2 is false, classify as c0 directly.
decide_a2_9(false, c0) :- !.

% If a2 is true, ask for a0 and continue decision process.
decide_a2_9(true, Class) :-
    ask(a0, A0),
    decide_a0_9(A0, Class).

% ---------------------------
% Decision Sub-Rules for a2 when coming from a1
% ---------------------------
% If a2 is false, ask for a0 and continue decision process.
decide_a2_1(false, Class) :-
    ask(a0, A0),
    decide_a0_1(A0, Class).

% If a2 is true, ask for a4 and continue decision process.
decide_a2_1(true, Class) :-
    ask(a4, A4),
    decide_a4_1(A4, Class).

% ---------------------------
% Decision Sub-Rules for a0 when coming from a9
% ---------------------------
% If a0 is false, ask for a4 and continue decision process.
decide_a0_9(false, Class) :-
    ask(a4, A4),
    decide_a4_9(A4, Class).

% If a0 is true, classify as c1 directly.
decide_a0_9(true, c1) :- !.

% ---------------------------
% Decision Sub-Rules for a0 when coming from a1
% ---------------------------
% If a0 is false, classify as c1 directly.
decide_a0_1(false, c1) :- !.

% If a0 is true, classify as c0 directly.
decide_a0_1(true, c0) :- !.

% ---------------------------
% Decision Sub-Rules for a4 when coming from a9
% ---------------------------
% If a4 is false, classify as c1 directly.
decide_a4_9(false, c1) :- !.

% If a4 is true, classify as c0 directly.
decide_a4_9(true, c0) :- !.

% ---------------------------
% Decision Sub-Rules for a4 when coming from a1
% ---------------------------
% If a4 is false, classify as c1 directly.
decide_a4_1(false, c1) :- !.

% If a4 is true, classify as c0 directly.
decide_a4_1(true, c0) :- !.

% -------------------------------------------------------
% User Input: ask/2
% -------------------------------------------------------
% The ask/2 predicate prompts the user for an attribute value.
% It expects the user to enter "true" or "false".
ask(Attribute, Value) :-
    write('Enter value for '), write(Attribute), write(' (true/false): '),
    read(Value),
    nl.

% -------------------------------------------------------
% Start Predicate: start/0
% -------------------------------------------------------
% This predicate starts the classification process.
% It calls predict_class/1 and displays the final result.
start :-
    predict_class(Class),
    write('The predicted class is: '), write(Class), nl.