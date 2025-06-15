% Prolog rules based on the decision tree

predict_class(Class) :-

    ask(a5, A5),

    decide(A5, Class).
 
decide(false, c0) :- !.

decide(true, Class) :-

    ask(a8, A8),

    decide_a8(A8, Class).
 
decide_a8(false, Class) :-

    ask(a9, A9),

    decide_a9(A9, Class).

decide_a8(true, Class) :-

    ask(a1, A1),

    decide_a1(A1, Class).
 
decide_a9(false, Class) :-

    ask(:, A2),

    decide_a2_9(A2, Class).

decide_a9(true, c1) :- !.
 
decide_a1(false, Class) :-

    ask(:, A2),

    decide_a2_1(A2, Class).

decide_a1(true, c0) :- !.
 
decide_a2_9(false, c0) :- !.

decide_a2_9(true, Class) :-

    ask(a0, A0),

    decide_a0_9(A0, Class).
 
decide_a2_1(false, Class) :-

    ask(a0, A0),

    decide_a0_1(A0, Class).

decide_a2_1(true, Class) :-

    ask(a4, A4),

    decide_a4_1(A4, Class).
 
decide_a0_9(false, Class) :-

    ask(a4, A4),

    decide_a4_9(A4, Class).

decide_a0_9(true, c1) :- !.
 
decide_a0_1(false, c1) :- !.

decide_a0_1(true, c0) :- !.
 
decide_a4_9(false, c1) :- !.

decide_a4_9(true, c0) :- !.
 
decide_a4_1(false, c1) :- !.

decide_a4_1(true, c0) :- !.
 
% Prompt user for attribute values

ask(Attribute, Value) :-

    write('Enter value for '), write(Attribute), write(' (true/false): '),

    read(Value),

    nl.
 
% Start the prediction process

start :-

    predict_class(Class),

    write('The predicted class is: '), write(Class), nl.

 