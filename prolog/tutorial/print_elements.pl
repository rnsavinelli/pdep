print_elements([Head | Tail]) :- write(Head), nl, print_elements(Tail).
print_elements(_).
