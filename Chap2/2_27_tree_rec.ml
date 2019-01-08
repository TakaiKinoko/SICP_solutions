type 'a tree = Leaf of 'a | Node of 'a tree * 'a tree

let rec count_leaves tree = 
    match tree with 
    | Leaf _-> 1
    | Node(l, r) -> count_leaves l + count_leaves r

(* test *)
let tree = Node(Node(Leaf 1, Leaf 2), Node(Leaf 3, Leaf 4))

let () = 
    print_endline(string_of_int (count_leaves tree))