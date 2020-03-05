(* Unparametrized types *)
module Type =
struct
  type type_struct =
    | Int
    | Float
    | Char
    | String
    | Boolean
    | List
    | Function
    | None

  let string_of_type = function
      Int -> "entier"
    | Float -> "reel"
    | Char -> "caractere"
    | String -> "chaine"
    | Boolean -> "boolean"
    | List -> "liste"
    | Function -> "fonction"
    | None -> "rien"

  let type_of_string = function
      "entier" -> Int
    | "reel" -> Float
    | "caractere" -> Char
    | "chaine" -> String
    | "booleen" -> Boolean
    | "liste" -> List
    | "fonction" -> Function
    | "rien" -> None
    | x -> failwith ("type_of_string: Undefined type: '" ^ x ^ "'")
end


type variable = {name: string; type_struct: Type.type_struct}

let print_variable var =
  print_endline ("var " ^ var.name ^ ": " ^ Type.string_of_type var.type_struct)

type expr =
  | Plus of expr * expr
  | Minus of expr * expr
  | Times of expr * expr
  | Divide of expr * expr
  | Equal of expr * expr
  | Greater of expr * expr
  | GreaterOrEqual of expr * expr
  | Lower of expr * expr
  | LowerOrEqual of expr * expr
  | And of expr * expr
  | Or of expr * expr
  | Not of expr
  | Value of Type.type_struct

type 'a tree =
  | Leaf of 'a
  | Tree of 'a * 'a tree list

module VarSet = Set.Make(struct type t = variable let compare = compare end)