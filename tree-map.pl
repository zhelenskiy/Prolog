insert_node(T1, T2, Key, Value, Result) :-
    rand_int(2000000000, Priority),
    merge(T1, node(Key, Value, Priority, nil, nil), TempTree),
    merge(TempTree, T2, Result).

split(nil, _, nil, nil, false).
split(node(TKey, _, _, TLeft, TRight), TKey, TLeft, TRight, true).
split(node(TKey, TValue, TPriority, TLeft, TRight), Key, node(TKey, TValue, TPriority, TLeft, T1), T2, Found) :-
    Key > TKey, split(TRight, Key, T1, T2, Found).
split(node(TKey, TValue, TPriority, TLeft, TRight), Key, T1, node(TKey, TValue, TPriority, T2, TRight), Found) :-
    Key < TKey, split(TLeft, Key, T1, T2, Found).

merge(nil, T, T).
merge(T1, node(T2Key, T2Value, T2Priority, T2Left, T2Right), node(T2Key, T2Value, T2Priority, NewTLeft, T2Right)) :-
    (_, _, T1Priority, _, _) = T1, T1Priority < T2Priority, merge(T1, T2Left, NewTLeft), !.
merge(node(T1Key, T1Value, T1Priority, T1Left, T1Right), T2, node(T1Key, T1Value, T1Priority, T1Left, NewTRight)) :-
    merge(T1Right, T2, NewTRight).

map_get(node(Key, Value, _, _, _), Key, Value).
map_get(node(TKey, _, _, TLeft, _), Key, Value) :- Key < TKey, map_get(TLeft, Key, Value).
map_get(node(TKey, _, _, _, TRight), Key, Value) :- Key > TKey, map_get(TRight, Key, Value).

map_put(Map, Key, Value, Result) :-
    split(Map, Key, T1, T2, _),
    insert_node(T1, T2, Key, Value, Result).

tree_build([], nil).
tree_build([(Key, Value) | Rest], Result) :- tree_build(Rest, Temp), map_put(Temp, Key, Value, Result).

map_remove(Map, Key, Result) :- split(Map, Key, T1, T2, Found), Found, merge(T1, T2, Result), !.
map_remove(Map, _, Map).

map_replace(Map, Key, Value, Result) :-
    split(Map, Key, T1, T2, Found), Found,
    insert_node(T1, T2, Key, Value, Result), !.
map_replace(Map, _, _, Map).
